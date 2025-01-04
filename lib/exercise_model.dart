class Exercise {
  final int id;
  final String name;
  final int amount;
  final int removeAmount;

  Exercise(
      {required this.id,
      required this.name,
      required this.amount,
      required this.removeAmount});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'removeAmount': removeAmount,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      removeAmount: map['removeAmount'],
    );
  }
}
