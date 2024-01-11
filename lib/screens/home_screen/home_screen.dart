import 'package:e_lenden/screens/home_screen/drawer_screen.dart';
import 'package:e_lenden/screens/invoice_screen/invoice_screen.dart';
import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/appbar.dart';
import 'package:e_lenden/widgets/main_widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}



class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle(title: "E-LenDen"),
      backgroundColor: appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            bottomButton(onpressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>InvoiceScreen()));
            }, text: Text("Add invoice +", style: KmainButtonText,))
          ],
        ),
      ),
      drawer: drawerScreen(),
    );
  }
}
