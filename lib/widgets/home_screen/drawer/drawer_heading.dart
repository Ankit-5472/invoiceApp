import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class drawer_heading extends StatelessWidget {
  const drawer_heading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child:  Icon(Icons.arrow_back, color: KprimaryColor,),
          onTap: () {Navigator.pop(context);},
        ),
        SizedBox(width: 10.0,),
        Text("Settings", style: KdrawerHeadingText,),
      ],
    );
  }
}