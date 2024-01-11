import 'package:e_lenden/screens/onboarding_screens/verification_screen.dart';
import 'package:e_lenden/utils/Logic/otp_logic/otp_function.dart';
import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/appbar_backbutton.dart';
import 'package:e_lenden/widgets/main_widgets/bottom_button.dart';
import 'package:e_lenden/widgets/main_widgets/input_divider.dart';
import 'package:e_lenden/widgets/main_widgets/user_input_details.dart';
import 'package:e_lenden/widgets/onboarding_screen/logo_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _addressFirst = TextEditingController();
  final TextEditingController _addressSecond = TextEditingController();
  OtpFunction otpFunction = OtpFunction();
  int generatedOtp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: appbarBackButton(),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Padding(
            padding: EdgeInsets.all(36.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                      child: Text(
                    "Your company's info",
                    style: KonboardingScreenText,
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  LogoPicker(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  userInputDetails(
                      controller: _companyName, name: "Company's Name"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  userInputDetails(controller: _email, name: "Email address"),
                  const inputDivider(),
                  userInputDetails(
                      controller: _phoneNumber, name: "Phone number"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  userInputDetails(
                      controller: _addressFirst, name: "Address line 1"),
                  const inputDivider(),
                  userInputDetails(
                      controller: _addressSecond, name: "Address line 2"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  bottomButton(
                      onpressed: () {
                        generatedOtp = otpFunction.generateOTP();
                        print(generatedOtp);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> otpVerification(generatedOTP: generatedOtp, verificationScreenName: "Verify")));
                        Get.snackbar("OTP", "$generatedOtp");
                      },
                      text: const Text(
                        "Next >",
                        style: KmainButtonText,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
