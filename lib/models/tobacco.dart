class Tobacco {
  final String name;
  final String url;
  final int amount;
  final bool nearEmpty;
  final String docID;

  Tobacco({this.name, this.amount, this.nearEmpty, this.url, this.docID});

  Tobacco.fromData(Map<String, dynamic> data)
      : name = data['name'] ?? '',
        amount = data['amount'] ?? 0,
        nearEmpty = data['nearEmpty'] ?? false,
        url = data['filepath'] ?? '',
        docID = data['docID'] ?? '';

  String get getName => this.name;
  String get getDocId => this.docID;
  int get getAmount => this.amount;
  bool get getNearEmpty => this.nearEmpty;
}
