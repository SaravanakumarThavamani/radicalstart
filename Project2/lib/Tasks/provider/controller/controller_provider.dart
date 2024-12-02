import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  var primaryOutput = '0';
  var secondaryOutput = '0';

  void addNumber(String num) {
    if (primaryOutput == '0') {
      primaryOutput = num;
    } else {
      primaryOutput += num;
    }
    notifyListeners();
  }

  void addOperator(String operator) {
    if (!primaryOutput.endsWith(operator)) {
      primaryOutput += ' $operator ';
    }
    notifyListeners();
  }

  void clear() {
    primaryOutput = '0';
    secondaryOutput = '0';
    notifyListeners();
  }

  void delete() {
    if (primaryOutput.isEmpty || primaryOutput.length == 1) {
      primaryOutput = '0';
    } else {
      primaryOutput = primaryOutput.substring(0, primaryOutput.length - 1);
    }
    notifyListeners();
  }

  void evaluate() {
    try {
      final expression =
          primaryOutput.replaceAll('×', '*').replaceAll('÷', '/');
      final result = double.parse(evalExpression(expression));
      primaryOutput = result.toString();
      secondaryOutput = primaryOutput;
    } catch (e) {
      secondaryOutput = 'Error';
    }
    notifyListeners();
  }

  String evalExpression(String expr) {
    List<String> tokens = expr.split(' ');
    double result = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      String operator = tokens[i];
      double nextNum = double.parse(tokens[i + 1]);
      if (operator == '+') result += nextNum;
      if (operator == '-') result -= nextNum;
      if (operator == '*') result *= nextNum;
      if (operator == '/') result /= nextNum;
      if (operator == '%') result %= nextNum;
    }
    return result.toString();
  }
}
