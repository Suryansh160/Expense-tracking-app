import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

//go to pub.dev and find the needed package

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleCont = TextEditingController();
  final amtCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.blue,
            child: Card(
              color: Colors.pink,
              child: Text('Chart!'),
              elevation: 10,
            ),
          ),
          UserTransactions()
        ],
      ),
    );
  }
}
