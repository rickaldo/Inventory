class Tobacco {
  final String name;
  final int amount;
  final bool nearEmpty;

  Tobacco({this.name, this.amount, this.nearEmpty});

  Tobacco.fromData(Map<String, dynamic> data)
      : name = data['name'] ?? '',
        amount = data['amount'] ?? 0,
        nearEmpty = data['nearEmpty'] ?? false;

  String get getName => this.name;
  int get getAmount => this.amount;
  bool get getNearEmpty => this.nearEmpty;
}
