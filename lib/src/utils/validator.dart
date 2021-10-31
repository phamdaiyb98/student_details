import 'function_helper.dart';

class Validator {
  static String validateTextField(value) {
    return isNullOrEmpty(value) ? 'This field not allow empty' : null;
  }
}
