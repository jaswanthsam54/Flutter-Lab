class CalculationRecord {
  final String id;
  final String expression;
  final String result;
  final DateTime timestamp;
  final bool isFavorite;

  const CalculationRecord({
    required this.id,
    required this.expression,
    required this.result,
    required this.timestamp,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'expression': expression,
    'result': result,
    'timestamp': timestamp.toIso8601String(),
    'isFavorite': isFavorite,
  };

  factory CalculationRecord.fromJson(Map<String, dynamic> json) => CalculationRecord(
    id: json['id'] as String,
    expression: json['expression'] as String,
    result: json['result'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    isFavorite: json['isFavorite'] as bool? ?? false,
  );
}
