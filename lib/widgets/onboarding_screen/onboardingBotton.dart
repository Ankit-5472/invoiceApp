import 'package:e_lenden/screens/onboarding_screens/signup_screen.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class onboardingBotton extends StatelessWidget {
  const onboardingBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Set the border radius
          ),
          fixedSize: Size.fromHeight(55),
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>signUpScreen()));
        }, child:const Text("Start your work",style: KonbordingBottonText));
  }
}