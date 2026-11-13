class ExpressionParser {
  static String sanitize(String input) {
    return input
        .replaceAll('×', '*')
        .replaceAll('÷', '/')
        .replaceAll('−', '-')
        .replaceAll(' ', '');
  }

  static bool hasBalancedParentheses(String expr) {
    int balance = 0;
    for (int i = 0; i < expr.length; i++) {
      if (expr[i] == '(') balance++;
      if (expr[i] == ')') balance--;
      if (balance < 0) return false;
    }
    return balance == 0;
  }
}
