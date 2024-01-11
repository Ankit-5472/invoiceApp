import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/onboarding_screen/loginBotton.dart';
import 'package:e_lenden/widgets/onboarding_screen/onboardingBotton.dart';
import 'package:flutter/material.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboardingScreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Invoices\nmade simple",style: KonboardingHeadingText),
                    const Text("Create professional\ninvoices in a just seconds",style: KonbordingBodyText),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    onboardingBotton(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                    loginBotton(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}

