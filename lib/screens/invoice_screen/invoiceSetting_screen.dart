import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/bottom_button.dart';
import 'package:e_lenden/widgets/main_widgets/user_input_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            userInputDetails(controller: payerName, name: "Name", validator: (text){
              if (text == null || text.isEmpty) {
                return 'Fill the Name';
              }
              return null;
            },),
            SizedBox(height: height * 0.02,),
            Text("Email Address",style: KonboardingTextBotton.copyWith(color: KblackColor)),
            userInputDetails(controller: payerEmail, name: "Email", validator: (text){
              if (text == null || text.isEmpty) {
                return 'Fill the Name';
              }
              return null;
            },),
            SizedBox(height: height * 0.02,),
            Text("Phone Number",style: KonboardingTextBotton.copyWith(color: KblackColor)),
            userInputDetails(controller: payerPhoneNumber, name: "Number", validator: (text){
              if (text == null || text.isEmpty) {
                return 'Fill the Name';
              }
              return null;
            },),
            SizedBox(height: height * 0.02,),
            Text("Address",style: KonboardingTextBotton.copyWith(color: KblackColor)),
            userInputDetails(controller: payarAddress, name: "Address", validator: (text){
              if (text == null || text.isEmpty) {
                return 'Fill the Name';
              }
              return null;
            },),
            SizedBox(height: height * 0.02,),
            Text("Item",style: KonboardingTextBotton.copyWith(color: KblackColor)),
            Card(
              color: KsecondaryColor,
              child: ListTile(
                title: const Text("+ Add items", style: TextStyle(color: KprimaryColor),),
                onTap: (){
                  Get.bottomSheet(
                    Container(
                      color: KappBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text("Item Name",style: KonbordingBottonText),
                            SizedBox(height: height * 0.005,),
                            userInputDetails(controller: itemName, name: "Name", validator: (text){
                              if (text == null || text.isEmpty) {
                                return 'Fill the Name';
                              }
                              return null;
                            },),
                            SizedBox(height: height * 0.01,),
                            const Text("Item cost",style: KonbordingBottonText),
                            SizedBox(height: height * 0.005,),
                            userInputDetails(controller: itemCost, name: "Cost", validator: (text){
                              if (text == null || text.isEmpty) {
                                return 'Fill the Name';
                              }
                              return null;
                            },),
                            SizedBox(height: height * 0.01,),
                            const Text("Quantity",style: KonbordingBottonText),
                            SizedBox(height: height * 0.005,),
                            userInputDetails(controller: quantity, name: "Number", validator: (text){
                              if (text == null || text.isEmpty) {
                                return 'Fill the Name';
                              }
                              return null;
                            },),
                            SizedBox(height: height * 0.02,),
                            bottomButton(onpressed: (){
                              addItemToList();
                              Get.back();
                            }, text: const Text("Add", style: KmainButtonText),),
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
              // final itemList = Provider.of<ItemListProvider>(context, listen: false).itemList;
              // final pdfBytes = await generatePDF(itemList);
              // print("$pdfBytes");
              // print('Generated PDF Size: ${pdfBytes.length} bytes');
              // await Printing.layoutPdf(
              //   onLayout: (PdfPageFormat format) async => pdfBytes,
              // );
            }, text: const Text("Save", style: KmainButtonText,))
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
