import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:web_scraper/web_scraper.dart';

Future<double> getBtcUsdPrice() async {
  final url = 'https://api.coindesk.com/v1/bpi/currentprice.json';
  final response = await http.get(url);
  Map<String, dynamic> json = jsonDecode(response.body);
  return json["bpi"]["USD"]["rate_float"];
}

Future<double> getUsdArsPrice() async {
  final scraper = WebScraper("https://www.dolarhoy.com");
  await scraper.loadWebPage("/cotizaciondolarblue");
  final elements = scraper.getElement("span.pull-right", []);
  final prices = elements
      .map((e) => double.parse(e["title"].substring(2).replaceAll(",", ".")))
      .toList();
  prices.sort();
  return prices[0] + (prices[1] - prices[0]) / 2;
}
