import 'package:test/test.dart';
import 'package:fordev/validation/validators/validators.dart';

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });

  test('Should return null if email is empty', () {
    final error = sut.validate('');

    expect(error, null);
  });

  test('Should return null if email is empty', () {
    final error = sut.validate(null);

    expect(error, null);
  });

  test('Should return null if email is valid', () {
    final error = sut.validate('paulojosecagol@gmail.com');

    expect(error, null);
  });

  test('Should return null if email is invalid', () {
    final error = sut.validate('paulojosecagol');

    expect(error, 'Campo inválido');
  });
}
