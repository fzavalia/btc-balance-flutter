import 'package:flutter_test/flutter_test.dart';
import 'package:btc_balance_flutter/core/prices.dart';

void main() {
  test("Obtaining BTC price in USD correctly", () async {
    final price = await getBtcUsdPrice();
    expect(price > 0, true);
  });

  test("Obtaining USD price in ARS correctly", () async {
    final price = await getUsdArsPrice();
    expect(price > 0, true);
  });
}
