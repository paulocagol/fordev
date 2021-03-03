import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fordev/infra/cache/local_storage_adapter.dart';
import 'package:mockito/mockito.dart';

class FlutterSecureStorageSpy extends Mock implements FlutterSecureStorage {}

void main() {
  LocalStorageAdapter sut;
  FlutterSecureStorageSpy secureStorage;
  String key;
  String value;

  setUp(() {
    secureStorage = FlutterSecureStorageSpy();
    sut = LocalStorageAdapter(secureStorage: secureStorage);
    key = faker.lorem.word();
    value = faker.guid.guid();
  });

  test('Should call save secure with correct values.', () async {
    await sut.saveSecure(key: key, value: value);

    verify(secureStorage.write(key: key, value: value));
  });

  test('Should throw if save secure throws.', () async {
    when(secureStorage.write(key: anyNamed('key'), value: anyNamed('value'))).thenThrow(Exception());

    final future = sut.saveSecure(key: key, value: value);

    expect(future, throwsA(TypeMatcher<Exception>()));
  });
}
