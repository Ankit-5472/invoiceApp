import 'package:e_lenden/screens/home_screen/home_screen.dart';
import 'package:e_lenden/screens/invoice_screen/invoice_screen.dart';
import 'package:e_lenden/utils/constants/color_constants.dart';
import 'package:e_lenden/utils/constants/constants.dart';
import 'package:e_lenden/widgets/main_widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class landingScreen extends StatefulWidget {
  const landingScreen({Key? key}) : super(key: key);

  @override
  State<landingScreen> createState() => _landingScreenState();
}

class _landingScreenState extends State<landingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: KprimaryColor, // Set the color of the icons
          size: 24.0, // Set the size of the icons
        ),
        title: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>homeScreen()), (route) => false);
            }, icon: Icon(Icons.arrow_back_ios)),
            Text("Back",style: KappbarBackButton,),
          ],
        ),
      ),
      backgroundColor: appBackgroundColor,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/landingImage.png"),
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
                      const Center(
                          child: Text(
                            "All set up",
                            style: KonboardingScreenText,
                          )),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      Text(
                        "You're ready to create your",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 18.0),
                      ),
                      Text(
                        "invoice",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 18.0),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                      bottomButton(onpressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InvoiceScreen()));
                      }, text: Text("Create invoice",style: KmainButtonText,)),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
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
