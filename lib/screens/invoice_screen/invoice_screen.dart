import 'package:e_lenden/screens/invoice_screen/invoicePreview_screen.dart';
import 'package:e_lenden/screens/invoice_screen/invoiceSetting_screen.dart';
import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/appbar_backbutton.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: KappBackgroundColor,
        appBar: AppBar(
          leading: const appbarBackButton(),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Setting'),
              Tab(text: 'Preview'),
            ],
            labelStyle: KappbarBackButton.copyWith(fontSize: 18.0),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  SettingScreen(),
                  Navigator(
                    onGenerateRoute: (RouteSettings settings) {
                      return MaterialPageRoute<void>(
                        builder: (BuildContext context) =>  PreviewScreen(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

