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
        title: Text("BTC Transactions"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: data.transactions.length + 1,
          itemBuilder: (context, index) => index < data.transactions.length
              ? Element(data.transactions[index])
              : Container(height: 75),
          separatorBuilder: (context, index) => Container(
            height: 10,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "BTC ${transaction.btc} / \$${transaction.investment}",
              style: TextStyle(
                  fontSize: 24,
                  color: transaction.positive ? Colors.green : Colors.red),
            ),
            IconButton(
              icon: Icon(
                Icons.remove,
                color: Colors.red,
              ),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
