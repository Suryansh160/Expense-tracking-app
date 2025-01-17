import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Set height for scrollable area
      child: widget.transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                //ANOTHER STYLE WHICH I DID'NT LIKE
                // return Card(
                //   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                //   elevation: 5,
                //   child: ListTile(
                //     leading: CircleAvatar(
                //       backgroundColor: Colors.purple,
                //       foregroundColor: Colors.white,
                //       radius: 30,
                //       child: Padding(
                //         padding: EdgeInsets.all(6),
                //         child: FittedBox(
                //             child:
                //                 Text('\$${widget.transactions[index].amount}')),
                //       ),
                //     ),
                //     title: Text(
                //       widget.transactions[index].title,
                //     ),
                //     subtitle: Text(DateFormat.yMMMd()
                //         .format(widget.transactions[index].date)),
                //   ),
                // );
                return Card(
                  child: ListTile(
                    leading: Container(
                      // margin:
                      //     EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 1),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${widget.transactions[index].amount.toStringAsFixed(2)}', // Dart treats this as a string
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.transactions[index].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('EEE, d/M/y')
                              .format(widget.transactions[index].date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () =>
                          widget.deleteTx(widget.transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: widget.transactions.length,
            ),
    );
  }
}
