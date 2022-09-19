import 'package:formz/formz.dart';

enum IsbnValidationError { empty }

class Isbn extends FormzInput<String, IsbnValidationError> {
  const Isbn.pure() : super.pure('');
  const Isbn.dirty([super.value = '']) : super.dirty();

  @override
  IsbnValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : IsbnValidationError.empty;
  }
}
