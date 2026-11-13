class UnitConverter {
  // Length (meters base)
  static const Map<String, double> lengthFactors = {
    'meters': 1.0,
    'kilometers': 1000.0,
    'centimeters': 0.01,
    'millimeters': 0.001,
    'miles': 1609.344,
    'feet': 0.3048,
    'inches': 0.0254,
  };

  static double convertLength(double value, String from, String to) {
    double inMeters = value * (lengthFactors[from] ?? 1.0);
    return inMeters / (lengthFactors[to] ?? 1.0);
  }

  // Temperature
  static double celsiusToFahrenheit(double c) => (c * 9.0 / 5.0) + 32.0;
  static double fahrenheitToCelsius(double f) => (f - 32.0) * 5.0 / 9.0;
  static double celsiusToKelvin(double c) => c + 273.15;
}
