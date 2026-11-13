import 'dart:math' as math;

class MathUtils {
  static double degToRad(double degrees) => degrees * (math.pi / 180.0);
  static double radToDeg(double radians) => radians * (180.0 / math.pi);

  static int factorial(int n) {
    if (n < 0) throw ArgumentError('Factorial not defined for negative numbers');
    if (n <= 1) return 1;
    int res = 1;
    for (int i = 2; i <= n; i++) {
      res *= i;
    }
    return res;
  }

  static int gcd(int a, int b) {
    while (b != 0) {
      int t = b;
      b = a % b;
      a = t;
    }
    return a.abs();
  }

  static int lcm(int a, int b) {
    if (a == 0 || b == 0) return 0;
    return ((a * b) ~/ gcd(a, b)).abs();
  }
}
