import "package:simplecalculator/button_keys.dart";
import "package:math_expressions/math_expressions.dart";

bool isDigit(String char) {
  return RegExp(r'^\d$').hasMatch(char);
}

bool isAnOperator(String buttonKey) => !isDigit(buttonKey);
