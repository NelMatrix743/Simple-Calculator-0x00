import "package:simplecalculator/button_keys.dart";
import "package:math_expressions/math_expressions.dart";

bool isDigit(String char) {
  return RegExp(r'^\d$').hasMatch(char);
}

bool isAnOperator(String buttonKey) => !isDigit(buttonKey);

(String, String) clearAllInput(
  String inputExpression,
  String expressionResult,
) {
  inputExpression = "0";
  expressionResult = "0";
  return (inputExpression, expressionResult);
}

String clearLastInput(String inputExpression) {
  if (isDigit(inputExpression[inputExpression.length - 1])) {
    // to clear digit
    if (inputExpression.length == 1) {
      return "0";
    }
    return inputExpression.substring(0, inputExpression.length - 1);
  }
  // to clear operator
  return inputExpression.substring(0, inputExpression.length - 3);
}

String insertDigit(int index, String inputExpression) {
  if (inputExpression.startsWith("0")) {
    inputExpression = "";
  }
  return inputExpression + supportedButtonKeys[index];
}

String insertOperator(int index, String inputExpression) {
  if (isDigit(inputExpression[inputExpression.length - 1])) {
    inputExpression += " ${supportedButtonKeys[index]} ";
  }
  return inputExpression;
}

String insertAnswer(String inputExpression, String expressionResult) {
  if (inputExpression.startsWith("0")) {
    inputExpression = expressionResult;
  } else if (!isDigit(inputExpression[inputExpression.length - 1])) {
    inputExpression += expressionResult;
  }
  return inputExpression;
}

String computeExpression(String inputExpression) {
  num exprResult;
  GrammarParser parser = GrammarParser();
  ContextModel context = ContextModel();
  RealEvaluator exprEvaluator = RealEvaluator(context);
  Expression expr = parser.parse(inputExpression);
  exprResult = exprEvaluator.evaluate(expr);
  return (exprResult % 1 == 0)
      ? exprResult.toInt().toString()
      : exprResult.toString();
}
