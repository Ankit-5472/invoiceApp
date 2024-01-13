import 'package:e_lenden/screens/home_screen/allInvoice_screen.dart';
import 'package:e_lenden/screens/home_screen/drawer_screen.dart';
import 'package:e_lenden/screens/home_screen/paidInvoice_screen.dart';
import 'package:e_lenden/screens/home_screen/unpaidInvoice_screen.dart';
import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "E-LenDen",
            style: KappBarText,
          ),
          bottom: const TabBar(
            tabs: [Tab(text: "All"), Tab(text: "Unpaid"), Tab(text: "Paid")],
            indicatorColor: KsecondaryColor,
            labelColor: KsecondaryColor,
            labelStyle: KonbordingBottonText,
            unselectedLabelColor: KappBackgroundColor,
            unselectedLabelStyle:
                KbuttonText,
          ),
          backgroundColor: KprimaryColor,
          iconTheme: const IconThemeData(color: Colors.white, size: 25.0),
        ),
        body: Column(
          children: [
            Expanded(
                child: TabBarView(
              children: [allInvoice(), unpaidInvoice(), paidInvoice()],
            ))
          ],
        ),
        drawer: drawerScreen(),
      ),
    );
  }
}
