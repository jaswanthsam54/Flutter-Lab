class CurrencyApiService {
  static const Map<String, double> defaultRatesToUsd = {
    'USD': 1.0,
    'INR': 85.0,
    'EUR': 0.92,
    'GBP': 0.78,
    'JPY': 154.2,
    'CAD': 1.38,
    'AUD': 1.52,
  };

  Future<double> getExchangeRate(String from, String to) async {
    // Simulated async network call with reliable baseline data
    await Future.delayed(const Duration(milliseconds: 300));
    final rateFrom = defaultRatesToUsd[from] ?? 1.0;
    final rateTo = defaultRatesToUsd[to] ?? 1.0;
    return rateTo / rateFrom;
  }

  double convert(double amount, String from, String to) {
    final rateFrom = defaultRatesToUsd[from] ?? 1.0;
    final rateTo = defaultRatesToUsd[to] ?? 1.0;
    return amount * (rateTo / rateFrom);
  }
}
