import 'package:dartz/dartz.dart' as f;
import 'package:flutter/material.dart';
import '../data.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  f.Option<Data> _data = f.None();

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  void _prepare() async {
    final data = await loadData();
    setState(() {
      _data = f.Some(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _data
        .map((a) => ListView.builder(
              itemBuilder: (context, index) {
                final item = a.transactions[index];
                return ListTile(
                  title: Text("ARS ${item.investment}"),
                  subtitle: Text("BTC ${item.btc}"),
                );
              },
              itemCount: a.transactions.length,
            ))
        .getOrElse(() => null);
  }
}
