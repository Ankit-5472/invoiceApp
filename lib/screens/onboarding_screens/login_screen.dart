import 'package:e_lenden/screens/onboarding_screens/verification_screen.dart';
import 'package:e_lenden/utils/Logic/otp_logic/otp_function.dart';
import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/appbar_backbutton.dart';
import 'package:e_lenden/widgets/main_widgets/bottom_button.dart';
import 'package:e_lenden/widgets/main_widgets/input_divider.dart';
import 'package:e_lenden/widgets/main_widgets/user_input_details.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  OtpFunction otpFunction = OtpFunction();
  int generatedOtp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KappBackgroundColor,
      appBar: appbarBackButton(),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children:[ Padding(
          padding: const EdgeInsets.fromLTRB(36.0, 0, 36.0, 36.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Image(image: AssetImage("assets/logo/E-LenDen-logos_black.png")),
                const Center(child: Text("Login",style: KonboardingScreenText),),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                userInputDetails(controller: _email, name: "Email address", validator: (text){
                  if (text == null || text.isEmpty) {
                    return 'Fill the Name';
                  }
                  return null;
                },),
                inputDivider(),
                userInputDetails(controller: _phoneNumber, name: "Phone number", validator: (text){
                  if (text == null || text.isEmpty) {
                    return 'Fill the Name';
                  }
                  return null;
                },),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                bottomButton(text: Text("Login",style: KmainButtonText,), onpressed: (){
                  generatedOtp = otpFunction.generateOTP();
                  print(generatedOtp);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>otpVerification(verificationScreenName: "Login",generatedOTP: generatedOtp,)));
                  Get.snackbar("OTP", "$generatedOtp");
                },),
              ],
            ),
          ),
        ),
    ],
      ),
    );
  }
}

