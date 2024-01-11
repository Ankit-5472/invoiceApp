import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class appbarBackButton extends StatelessWidget implements PreferredSizeWidget{
  const appbarBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: KprimaryColor, // Set the color of the icons
        size: 24.0, // Set the size of the icons
      ),
      title: Row(
        children: [
          Text("Back",style: KappbarBackButton,),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}