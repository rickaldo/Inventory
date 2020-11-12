class Drink {
  final String name;
  final int amount;

  Drink({this.amount, this.name});

  Drink.fromData(Map<String, dynamic> data)
      : name = data['name'] ?? '',
        amount = data['amount'] ?? 0;

  String get getName => this.name;
  int get getAmount => this.amount;
}
