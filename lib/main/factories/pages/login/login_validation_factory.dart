import 'package:fordev/main/builders/builders.dart';
import 'package:fordev/main/builders/validation_builder.dart';
import 'package:fordev/validation/validators/protocols/field_validation.dart';
import 'package:fordev/validation/validators/validation_composite.dart';

ValidationComposite makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').riquired().email().build(),
    ...ValidationBuilder.field('password').riquired().build()
  ];
}
