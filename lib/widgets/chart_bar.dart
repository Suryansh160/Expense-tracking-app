import 'package:flutter/material.dart';

class chartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  chartBar(this.label, this.spendingAmount, this.spendingPercentage);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              '\$${spendingAmount.toStringAsFixed(0)}',
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 60, // Container height
                width: 10, // Container width
                child: Stack(
                  alignment: Alignment
                      .bottomCenter, // Align all children from the bottom
                  children: <Widget>[
                    // FractionallySizedBox aligned from bottom
                    FractionallySizedBox(
                      heightFactor:
                          spendingPercentage, // The height will be based on this factor
                      alignment: Alignment
                          .bottomCenter, // Align the child at the bottom
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
