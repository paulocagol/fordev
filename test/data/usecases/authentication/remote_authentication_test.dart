import 'package:flutter_test/flutter_test.dart';

import 'package:faker/faker.dart';
import 'package:fordev/domain/helpers/helpers.dart';
import 'package:mockito/mockito.dart';

import 'package:fordev/domain/usecases/authentication.dart';

import 'package:fordev/data/http/http.dart';
import 'package:fordev/data/usecases/usecases.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  AuthenticationParams params;
  HttpClientSpy httpClient;
  String url;

  Map mockValidData() =>
      {'accessToken': faker.guid.guid(), 'name': faker.person.name()};

  PostExpectation _mockRequest() =>
      when(
        httpClient.request(
          url: anyNamed('url'),
          method: anyNamed('method'),
          body: anyNamed('body'),
        ),
      );

  void mockHttpData(Map data) {
    _mockRequest().thenAnswer((_) async => data);
  }

  void mockHttpError(HttpError error) {
    _mockRequest().thenThrow(error);
  }

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpsUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
    params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password(),
    );
    mockHttpData(mockValidData());
  });

  test(
    'Should call HttpClient with correct values',
        () async {
      await sut.auth(params);

      verify(
        httpClient.request(
          url: url,
          method: 'post',
          body: {'email': params.email, 'password': params.secret},
        ),
      );
    },
  );

  test(
    'Should throw UnexpectedError if HttpClient returns 400',
        () async {
      mockHttpError(HttpError.badRequest);

      final params = AuthenticationParams(
        email: faker.internet.email(),
        secret: faker.internet.password(),
      );

      final future = sut.auth(params);

      expect(
        future,
        throwsA(DomainError.unexpected),
      );
    },
  );

  test(
    'Should throw UnexpectedError if HttpClient returns 404',
        () async {
      mockHttpError(HttpError.notFound);

      final params = AuthenticationParams(
        email: faker.internet.email(),
        secret: faker.internet.password(),
      );

      final future = sut.auth(params);

      expect(
        future,
        throwsA(DomainError.unexpected),
      );
    },
  );

  test(
    'Should throw UnexpectedError if HttpClient returns 500',
        () async {
      mockHttpError(HttpError.serverError);

      final params = AuthenticationParams(
        email: faker.internet.email(),
        secret: faker.internet.password(),
      );

      final future = sut.auth(params);

      expect(
        future,
        throwsA(DomainError.unexpected),
      );
    },
  );

  test(
    'Should throw InvalidCredentialsError if HttpClient returns 401',
        () async {
      mockHttpError(HttpError.unauthorized);

      final params = AuthenticationParams(
        email: faker.internet.email(),
        secret: faker.internet.password(),
      );

      final future = sut.auth(params);

      expect(
        future,
        throwsA(DomainError.invalidCredentials),
      );
    },
  );

  test(
    'Should return an Account if HttpClient returns 200',
        () async {
      final validData = mockValidData();
      mockHttpData(validData);
      final account = await sut.auth(params);

      expect(
        account.token,
        validData['accessToken'],
      );
    },
  );

  test(
    'Should throw UnexpectedError if HttpClient returns 200 with invalid data',
        () async {
      mockHttpData({
        'invalid_key': 'invalid_value',
      },);

      final future = sut.auth(params);

      expect(
        future,
        throwsA(DomainError.unexpected),
      );
    },
  );
}
