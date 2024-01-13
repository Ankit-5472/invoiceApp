import 'package:e_lenden/screens/invoice_screen/invoice_screen.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/bottom_button.dart';
import 'package:e_lenden/widgets/main_widgets/invoiceDetails_card.dart';
import 'package:flutter/material.dart';

class unpaidInvoice extends StatefulWidget {
  const unpaidInvoice({Key? key}) : super(key: key);

  @override
  State<unpaidInvoice> createState() => _unpaidInvoiceState();
}

class _unpaidInvoiceState extends State<unpaidInvoice> {

  String invoiceNo = "INV0002";
  String dueDate = "02/01/2024";
  String payerName = "Smith Abc";
  String amount = "1000";
  String invoiceNo1 = "INV0003";
  String dueDate1 = "02/02/2024";
  String payerName1 = "Xyz Abc";
  String amount1 = "1000";

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
              dueDate: Text(dueDate,style:KunpaidInvoiceDateText),
              payerName: Text(payerName),
              amount: Text("₹$amount"),
            ),
            invoiceDetails(
              invoiceNumber: Text(invoiceNo1),
              dueDate: Text(dueDate1),
              payerName: Text(payerName1),
              amount: Text("₹$amount1"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
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
