import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget implements PreferredSizeWidget {
  AppBarTitle({required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: KappBarText,),
      backgroundColor: KprimaryColor,
      iconTheme: IconThemeData(color: Colors.white, size: 25.0),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}