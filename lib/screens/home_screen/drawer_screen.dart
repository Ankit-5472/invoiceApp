import 'package:e_lenden/widgets/home_screen/drawer/drawer_Logo.dart';
import 'package:e_lenden/widgets/home_screen/drawer/drawer_account_info.dart';
import 'package:e_lenden/widgets/home_screen/drawer/drawer_heading.dart';
import 'package:e_lenden/widgets/home_screen/drawer/drawer_list.dart';
import 'package:e_lenden/widgets/home_screen/drawer/drawer_logout.dart';
import 'package:flutter/material.dart';

class drawerScreen extends StatelessWidget {
  const drawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
            child: drawer_heading(),
          ),
          drawerAccountInfo(),
          drawerList(
            icons: Icons.person,
            name: "Profile",
            onTap: () {},
          ),
          drawerList(icons: Icons.receipt, name: "Invoice", onTap: () {}),
          drawerList(
              icons: Icons.info_sharp, name: "General Info", onTap: () {}),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          drawerlogout(),
          drawerlogo(),
        ],
      ),
    );
  }
}


