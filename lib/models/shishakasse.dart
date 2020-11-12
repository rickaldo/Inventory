class Shishakasse {
  final int amount;

  Shishakasse({this.amount});

  Shishakasse.fromData(Map<String, dynamic> data)
      : amount = data['amount'] ?? '';

  int get getAmount => amount;
}
