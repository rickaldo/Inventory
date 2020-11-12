class Drink {
  final String name;
  final int amount;
  final String docID;
  final String url;

  Drink({this.amount, this.name, this.docID, this.url});

  Drink.fromData(Map<String, dynamic> data)
      : name = data['name'] ?? '',
        amount = data['amount'] ?? 0,
        docID = data['docID'] ?? '',
        url = data['filepath'];

  String get getName => this.name;
  int get getAmount => this.amount;
  String get getDocId => this.docID;
  String get getUrl => this.url;
}
