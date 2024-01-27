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
import 'package:firebase_auth/firebase_auth.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;


  OtpFunction otpFunction = OtpFunction();
  int generatedOtp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KappBackgroundColor,
      appBar: appbarBackButton(),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Padding(
            padding: EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
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
                      controller: _companyName,
                      name: "Company's Name",
                      validator: (text) {
                        (text == null || text.isEmpty) ? 'Fill the Box' : null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    userInputDetails(
                      controller: _email,
                      name: "Email address",
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Fill the email';
                        }else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(text)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const inputDivider(),
                    userInputDetails(
                      controller: _phoneNumber,
                      name: "Phone number",
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Fill the Name';
                        } else if (!RegExp(r'^(\+91)?\d{10}$').hasMatch(text)) {
                          // Check for either 10 digits directly or 10 digits preceded by "+91"
                          return 'Enter a valid 10-digit phone number';
                        }
                        return null;
                      },),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    userInputDetails(
                      controller: _addressFirst,
                      name: "Address line 1",
                      validator: (text) {
                        (text == null || text.isEmpty) ? 'Fill the Box' : null;
                      }
                    ),
                    const inputDivider(),
                    userInputDetails(
                      controller: _addressSecond,
                      name: "Address line 2",
                      validator: (text) {
                        (text == null || text.isEmpty) ? 'Fill the Box' : null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    bottomButton(
                        onpressed: () async {
                          if(_formKey.currentState!.validate()){
                            await auth.verifyPhoneNumber(
                              verificationCompleted: (_){},
                                verificationFailed: (e){
                                print(e);
                                },
                                codeSent: (String verificationId, int? token){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => otpVerification(
                                              generatedOTP: int.parse(verificationId),
                                              verificationScreenName: "Verify")));
                                },
                                codeAutoRetrievalTimeout: (e){
                                print(e);
                                },
                              phoneNumber: _phoneNumber.text,
                            );
                            // generatedOtp = otpFunction.generateOTP();
                            // print(generatedOtp);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => otpVerification(
                            //             generatedOTP: generatedOtp,
                            //             verificationScreenName: "Verify")));
                            // Get.snackbar("OTP", "$generatedOtp");
                          }
                        },
                        text: const Text(
                          "Next >",
                          style: KmainButtonText,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
