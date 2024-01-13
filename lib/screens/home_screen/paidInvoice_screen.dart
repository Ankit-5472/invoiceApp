import 'package:e_lenden/screens/invoice_screen/invoice_screen.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/bottom_button.dart';
import 'package:e_lenden/widgets/main_widgets/invoiceDetails_card.dart';
import 'package:flutter/material.dart';

class paidInvoice extends StatefulWidget {
  const paidInvoice({Key? key}) : super(key: key);

  @override
  State<paidInvoice> createState() => _paidInvoiceState();
}

class _paidInvoiceState extends State<paidInvoice> {

  String invoiceNo = "INV0001";
  String dueDate = "Paid";
  String payerName = "John Abc";
  String amount = "1000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            invoiceDetails(
              invoiceNumber: Text(invoiceNo),
              dueDate: Text(dueDate,style: KpaidInvoiceDateText),
              payerName: Text(payerName),
              amount: Text("₹$amount"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
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
      ),
    );
  }
}
