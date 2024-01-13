import 'package:flutter/material.dart';

class invoiceDetails extends StatelessWidget {
  invoiceDetails({required this.invoiceNumber, required this.dueDate, required this.payerName, required this.amount});

  final Text invoiceNumber;
  final Text dueDate;
  final Text payerName;
  final Text amount;

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        title: Row(
          children: [invoiceNumber, Spacer(), dueDate],
        ),
        subtitle: Row(
          children: [payerName, Spacer(), amount],
        ),
      ),
    );
  }
}


