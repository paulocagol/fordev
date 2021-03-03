import 'package:fordev/validation/validators/validators.dart';
import 'package:fordev/validation/validators/protocols/protocols.dart';

class ValidationBuilder {
  static ValidationBuilder _instace;

  String fieldName;
  List<FieldValidation> validations = [];

	ValidationBuilder._();

  static ValidationBuilder field(String fieldName) {
    _instace = ValidationBuilder._();
    _instace.fieldName = fieldName;
    return _instace;
  }

  ValidationBuilder riquired() {
    validations.add(RequiredFieldValidation(fieldName));
    return this;
  }

  ValidationBuilder email() {
    validations.add(EmailValidation(fieldName));
    return this;
  }

  List<FieldValidation> build() => validations;
}
