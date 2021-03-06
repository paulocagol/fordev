import 'package:fordev/presentation/protocols/protocols.dart';
import 'package:fordev/validation/validators/protocols/protocols.dart';
import 'package:meta/meta.dart';



class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  String validate({@required String field, @required String value}) {
    String error;
    for (final validation in validations.where((v) => v.field == field)) {
      final error = validation.validate(value);
      if (error?.isNotEmpty == true) return error;
    }
    return error;
  }
}