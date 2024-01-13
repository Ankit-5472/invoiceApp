import 'dart:async';
import 'package:e_lenden/screens/home_screen/home_screen.dart';
import 'package:e_lenden/screens/onboarding_screens/landing_screen.dart';
import 'package:e_lenden/utils/Logic/otp_logic/otp_function.dart';
import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/appbar_backbutton.dart';
import 'package:e_lenden/widgets/main_widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class otpVerification extends StatefulWidget {
  otpVerification({required this.generatedOTP, required this.verificationScreenName});
  int generatedOTP;
  final String verificationScreenName;

  @override
  State<otpVerification> createState() => _otpVerificationState();
}

class _otpVerificationState extends State<otpVerification> {



  List<FocusNode> otpFocusNodes = List.generate(4, (index) => FocusNode());
  List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController());
  OtpFunction otpFunction = OtpFunction();


  late Timer _timer;
  int _timerSeconds = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          _timer.cancel(); // Stop the timer when it reaches 0
        }
      });
    });
  }


  int getEnteredOTP() {
    String otpString = otpControllers.map((controller) => controller.text).join();
    return int.tryParse(otpString) ?? 0;
  }



  @override
  void dispose() {
    // Dispose of the FocusNodes to avoid memory leaks
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
    _timer.cancel();
  }


  @override
  Widget build(BuildContext context) {
    //Fluttertoast.showToast(msg: "${widget.generatedOTP}");
    return Scaffold(
      backgroundColor: KappBackgroundColor,
      appBar: appbarBackButton(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(36.0, 0, 36.0, 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Image(
                    image: AssetImage("assets/logo/E-LenDen-logos_black.png")),
                Center(
                  child:
                      Text("${widget.verificationScreenName}", style: KonboardingScreenText),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                Text(
                  "Confirmation code has been",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 18.0),
                ),
                Text(
                  "sent to your number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 18.0),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 4; i++) // Use a loop to create OTP boxes
                      buildOtpBox(i),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Send one more code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 18.0),
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      "$_timerSeconds Sec",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 18.0),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                bottomButton(onpressed: (){
                  print("Button Clicked");
                  int enteredOTP = getEnteredOTP(); // Fetch entered OTP from controllers
                  _timerSeconds > 0 ? confirmOTP(enteredOTP) : sendCodeAgain();
                },
                  text: Text(_timerSeconds > 0 ? "Confirm" : "Send Code Again", style: KmainButtonText,),),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildOtpBox(int index) {
    return Container(
      width: 50.0,
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color
        borderRadius: BorderRadius.circular(10.0), // Adjust border radius if needed
      ),
      child: TextField(
        controller: otpControllers[index],
        focusNode: otpFocusNodes[index],
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
        onChanged: (value) {
          // Automatically move focus to the next OTP box
          if (value.isNotEmpty && index < otpFocusNodes.length - 1) {
            FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
          }
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero, // Remove default padding
          counter: Offstage(), // Hide the default character counter
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  sendCodeAgain() {
    setState(() {
      widget.generatedOTP =  otpFunction.generateOTP();
      _timerSeconds = 60;
      print("New OTP: ${widget.generatedOTP}");
      startTimer();
    });
  }

  confirmOTP(int enteredOTP) {
    if (enteredOTP == widget.generatedOTP) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>landingScreen()), (route) => false);
      print("OTP is correct!");
    } else {
      // OTP is incorrect, handle accordingly
      print("Incorrect OTP. Please try again.");
    }
  }
}
