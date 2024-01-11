import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class drawerList extends StatelessWidget {
  drawerList({required this.icons, required this.name, required this.onTap});
  final VoidCallback onTap;
  final String name;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: KdrawerColor, // Adjust the color as needed
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icons,
          color: KprimaryColor,
        ),
        title: Row(
          children: [
            Text("$name"),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined, size: 16.0),
          ],
        ),
        onTap: (){},
      ),
    );
  }
}