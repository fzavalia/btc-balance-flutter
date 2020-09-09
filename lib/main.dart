// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' as f;
import './prices.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Balance(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("pressed"),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class Balance extends StatefulWidget {
  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  f.Option<double> _btcUsd = f.None();
  f.Option<double> _usdArs = f.None();

  @override
  void initState() {
    super.initState();
    _fetchPrices();
  }

  void _fetchPrices() async {
    final btcUsd = await getBtcUsdPrice();
    final usdArs = await getUsdArsPrice();
    setState(() {
      _btcUsd = f.Some(btcUsd);
      _usdArs = f.Some(usdArs);
    });
  }

  bool isFetching() => _btcUsd.isNone() || _usdArs.isNone();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text("BTC")),
              Expanded(child: Text("0.2345"))
            ],
          ),
          Row(children: [
            Expanded(child: Text("BTC")),
            Expanded(child: Text("0.2345"))
          ]),
        ],
      ),
    );
  }
}
