import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleCont = TextEditingController();

  final amtCont = TextEditingController();

  void submit() {
    final enteredTitle = titleCont.text;
    final enteredAmount = double.parse(amtCont.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleCont,
              onSubmitted: (_) => submit(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amtCont,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submit(),
              //onChanged: (value) => amountInput = value,
            ),
            OutlinedButton(
              onPressed: submit,
              child: Text('Add Transaction'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
