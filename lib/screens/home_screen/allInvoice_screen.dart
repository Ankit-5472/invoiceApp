import 'package:e_lenden/screens/invoice_screen/invoice_screen.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/bottom_button.dart';
import 'package:e_lenden/widgets/main_widgets/invoiceDetails_card.dart';
import 'package:flutter/material.dart';

class allInvoice extends StatefulWidget {
  @override
  State<allInvoice> createState() => _allInvoiceState();
}

class _allInvoiceState extends State<allInvoice> {
  String invoiceNo = "INV0002";
  String dueDate = "02/02/2024";
  String payerName = "Xyz Abc";
  String amount = "1000";
  String invoiceNo1 = "INV0001";
  String dueDate1 = "Paid";
  String payerName1 = "John Abc";
  String amount1 = "1000";
  String invoiceNo2 = "INV0003";
  String dueDate2 = "02/01/2024";
  String payerName2 = "Smith Abc";
  String amount2 = "1000";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          invoiceDetails(
            invoiceNumber: Text(invoiceNo),
            dueDate: Text(dueDate),
            payerName: Text(payerName),
            amount: Text("₹$amount"),
          ),
          invoiceDetails(
            invoiceNumber: Text(invoiceNo1),
            dueDate: Text(dueDate1,style: KpaidInvoiceDateText),
            payerName: Text(payerName1),
            amount: Text("₹$amount1"),
          ),
          invoiceDetails(
            invoiceNumber: Text(invoiceNo2),
            dueDate: Text(dueDate2,style: KunpaidInvoiceDateText),
            payerName: Text(payerName2),
            amount: Text("₹$amount2"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.41,
          ),
          bottomButton(
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InvoiceScreen()));
              },
              text: const Text(
                "Add invoice +",
                style: KmainButtonText,
              ))
        ],
      ),
    );
  }
}
