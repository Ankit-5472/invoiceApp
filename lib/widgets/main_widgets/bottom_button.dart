import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class bottomButton extends StatelessWidget {
  bottomButton({required this.onpressed, required this.text});

  final void Function() onpressed;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: KprimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Set the border radius
          ),
          fixedSize: Size.fromHeight(55),
        ),
        onPressed: onpressed, child: text);
  }
}