import 'package:e_lenden/screens/onboarding_screens/onboarding_screen.dart';
import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:flutter/material.dart';


class drawerlogout extends StatelessWidget {
  const drawerlogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10), // Decrease padding to reduce width
      child: OutlinedButton(onPressed: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => onBoardingScreen()),
              (route) => false, // Remove all existing routes
        );
      }, child: Text("Log Out", style: KlogoutButton,), style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Set the border radius
        ),
        side: const BorderSide(
          width: 2.0, // Set the border width
          color: KprimaryColor, // Set the border color
        ),
      ),
      ),
    );
  }
}

