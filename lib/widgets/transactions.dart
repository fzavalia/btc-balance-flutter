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

  bool showDelete = false;

  Transaction toDelete;

  void _showAlert(BuildContext context, Transaction transaction) => showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Warning!"),
            content: Text("Do you really want to delete the transaction?"),
            actions: [
              new FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text("No")),
              new FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text("Yes"))
            ],
          ));

  Widget _buildList(BuildContext context) {
    final transactions = data.transactions;

    return ListView.separated(
        itemCount: transactions.length + 1,
        itemBuilder: (context, index) => index >= data.transactions.length
            ? Container(height: 75)
            : Element(
                transaction: data.transactions[index],
                onDelete: () => _showAlert(context, data.transactions[index])),
        separatorBuilder: (context, index) => Container(
              height: 10,
            ));
  }

  @override
  Widget build(BuildContext context) {
    print(showDelete);
    print(toDelete);
    return Scaffold(
      appBar: AppBar(
        title: Text("BTC Transactions"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: _buildList(context),
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
  final void Function() onDelete;

  Element({Key key, this.transaction, this.onDelete}) : super(key: key);

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
              onPressed: onDelete,
            )
          ],
        ),
      ),
    );
  }
}
