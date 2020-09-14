import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

Data _data;

Future<Data> getData() async {
  if (_data == null) {
    _data = await _loadData();
  }
  return _data;
}

Future<void> updateData(Data data) async {
  _data = data;

  final dir = await getApplicationDocumentsDirectory();
  final file = File("${dir.path}/data.json");
  final encodedData = jsonEncode(data);

  await file.writeAsString(encodedData);
}

Future<Data> _loadData() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File("${dir.path}/data.json");
  final exists = await file.exists();

  if (!exists) {
    return Data(List.empty());
  }

  final str = await file.readAsString();

  return Data.fromJson(jsonDecode(str));
}

// Model

class Data {
  final List<Transaction> transactions;

  factory Data.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonTrxs = json["transactions"];
    final trxs = jsonTrxs.map((e) => Transaction.fromJson(e)).toList();
    return Data(trxs);
  }

  Map<String, dynamic> toJson() =>
      ({"transactions": transactions.map((e) => e.toJson()).toList()});

  Data(this.transactions);
}

class Transaction {
  final double investment;
  final double btc;
  final bool positive;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      Transaction(json["investment"], json["btc"], json["positive"]);

  Transaction(this.investment, this.btc, this.positive);

  Map<String, dynamic> toJson() =>
      ({"investment": investment, "btc": btc, "positive": positive});
}
