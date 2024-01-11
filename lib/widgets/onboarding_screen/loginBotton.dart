import 'package:e_lenden/screens/onboarding_screens/login_screen.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class loginBotton extends StatelessWidget {
  const loginBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?",style: KonbordingText,),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>loginScreen()));
        }, child: const Text("Login",style: KonboardingTextBotton)),
      ],
    );
  }
}