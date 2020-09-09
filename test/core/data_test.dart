import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import '../../lib/core/data.dart';

void main() {
  const dataJsonStr =
      '{"transactions":[{"investment":10.0,"btc":10.0,"positive":true}]}';

  test("Serialize Data", () {
    final data = Data([Transaction(10, 10, true)]);
    final encoded = jsonEncode(data);
    expect(encoded, dataJsonStr);
  });

  test("Deserialize Data", () {
    final data = Data.fromJson(jsonDecode(dataJsonStr));
    expect(data.transactions.length, 1);
    expect(data.transactions[0].investment, 10);
    expect(data.transactions[0].btc, 10);
    expect(data.transactions[0].positive, true);
  });
}
