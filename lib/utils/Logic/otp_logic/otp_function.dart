import 'dart:math';

class OtpFunction {

  int generateOTP() {
    return 1000 + Random().nextInt(9000);
  }

}
