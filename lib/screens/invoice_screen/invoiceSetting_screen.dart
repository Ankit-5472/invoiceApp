import 'package:e_lenden/providers/item_list.dart';
import 'package:e_lenden/screens/invoice_screen/invoicePreview_screen.dart';
import 'package:e_lenden/services/pdf_generator/generate_pdf.dart';
import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/bottom_button.dart';
import 'package:e_lenden/widgets/main_widgets/user_input_details.dart';
import 'package:e_lenden/widgets/onboarding_screen/onboardingBotton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}


class Item {
  String name;
  double cost;
  int quantity;

  Item({required this.name, required this.cost, required this.quantity});
}

class _SettingScreenState extends State<SettingScreen> {

  final TextEditingController payerName = TextEditingController();
  final TextEditingController payerEmail = TextEditingController();
  final TextEditingController payerPhoneNumber = TextEditingController();
  final TextEditingController payarAddress = TextEditingController();

  final TextEditingController itemName = TextEditingController();
  final TextEditingController itemCost = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  List<Item> itemList = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(36.0, 16.0, 36.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Payer Name",style: KonboardingTextBotton.copyWith(color: KblackColor),),
            userInputDetails(controller: payerName, name: "Name"),
            SizedBox(height: height * 0.02,),
            Text("Email Address",style: KonboardingTextBotton.copyWith(color: KblackColor)),
            userInputDetails(controller: payerEmail, name: "Email"),
            SizedBox(height: height * 0.02,),
            Text("Phone Number",style: KonboardingTextBotton.copyWith(color: KblackColor)),
            userInputDetails(controller: payerPhoneNumber, name: "Number"),
            SizedBox(height: height * 0.02,),
            Text("Address",style: KonboardingTextBotton.copyWith(color: KblackColor)),
            userInputDetails(controller: payarAddress, name: "Address"),
            SizedBox(height: height * 0.02,),
            Text("Item",style: KonboardingTextBotton.copyWith(color: KblackColor)),
            Card(
              color: KsecondaryColor,
              child: ListTile(
                title: Text("+ Add"),
                subtitle: Text("Items"),
                onTap: (){
                  Get.bottomSheet(
                    Container(
                      color: KprimaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Item Name",style: KmainButtonText),
                            userInputDetails(controller: itemName, name: "Name"),
                            Text("Item cost",style: KmainButtonText),
                            userInputDetails(controller: itemCost, name: "Cost"),
                            Text("Quantity",style: KmainButtonText),
                            userInputDetails(controller: quantity, name: "Number"),
                            SizedBox(height: height * 0.02,),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  addItemToList();
                                  Get.back();// Close the bottom sheet
                                },
                                child: Text("Add Item"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  );
                },
              ),
            ),
            Column(
              children: itemList.map((item) {
                return Card(
                  color: KprimaryColor,
                  child: ListTile(
                    title: Text(item.name,style: KonboardingTextBotton),
                    subtitle: Text('Cost: \₹${item.cost}, Quantity: ${item.quantity}',style: KonboardingTextBotton,),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: height * 0.04,),
            bottomButton(onpressed: () async {
              final itemList = Provider.of<ItemListProvider>(context, listen: false).itemList;
              final pdfBytes = await generatePDF(itemList);
              print("$pdfBytes");
              print('Generated PDF Size: ${pdfBytes.length} bytes');
              await Printing.layoutPdf(
                onLayout: (PdfPageFormat format) async => pdfBytes,
              );
            }, text: Text("Save", style: KmainButtonText,))
          ],
        ),
      ),
    );
  }
  void addItemToList() {
    String name = itemName.text;
    double cost = double.tryParse(itemCost.text) ?? 0.0;
    int qty = int.tryParse(quantity.text) ?? 0;

    if (name.isNotEmpty && cost > 0 && qty > 0) {
      setState(() {
        itemList.add(Item(name: name, cost: cost, quantity: qty));
      });
    }
  }

}
