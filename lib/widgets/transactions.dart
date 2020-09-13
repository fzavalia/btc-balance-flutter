import 'package:flutter/material.dart';
import '../core/data.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final Data data = Data([
    Transaction(1500, 0.234, true),
    Transaction(50000, 0.234, false),
    Transaction(1200, 0.234, true),
    Transaction(3000, 0.234, true),
    Transaction(1500, 0.234, true),
    Transaction(50000, 0.234, false),
    Transaction(1200, 0.234, true),
    Transaction(3000, 0.234, true),
    Transaction(1500, 0.234, true),
    Transaction(50000, 0.234, false),
    Transaction(1200, 0.234, true),
    Transaction(3000, 0.234, true),
    Transaction(1500, 0.234, true),
    Transaction(50000, 0.234, false),
    Transaction(1200, 0.234, true),
    Transaction(3000, 0.234, true),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BTC Purchases"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: data.transactions.length,
          itemBuilder: (context, index) => Element(data.transactions[index]),
          separatorBuilder: (context, index) => Container(
            height: 10,
          ),
        ),
      ),
    );
  }
}

class Element extends StatelessWidget {
  final Transaction transaction;

  Element(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff333333), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "${transaction.btc} / ${transaction.investment}",
          style: TextStyle(
              fontSize: 24,
              color: transaction.positive ? Colors.green : Colors.red),
        ),
      ),
    );
  }
}
