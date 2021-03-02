import 'package:fordev/validation/validators/email_validation.dart';
import 'package:fordev/validation/validators/required_field_validation.dart';
import 'package:fordev/validation/validators/validation_composite.dart';

ValidationComposite makeLoginValidation() {
  return ValidationComposite([
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password'),
  ]);
}
