import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
final titleCont=TextEditingController();
final amtCont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Card(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleCont,
                    // onChanged: (value) {
                    //   titleInput = value;
                    // },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amtCont,
                    //onChanged: (value) => amountInput = value,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      print(titleCont.text);
                    },
                    child: Text('Add Transaction'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
}
