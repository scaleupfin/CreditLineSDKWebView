import 'package:deynamic_update/screen/create_account/pan_number.dart';
import 'package:deynamic_update/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

import '../../screen/auth/email_verify_screen.dart';
import '../../screen/auth/otp_screen.dart';
import '../../screen/auth/signin_screen.dart';
import '../../screen/create_account/setup_account.dart';
import '../../screen/onboarding/onboarding_screen.dart';
import '../common_widgets/PermissionPage.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.permiction):
        final args = settings.arguments as Map<String, dynamic>;
        final String mobileNumber = args['mobileNumber'] as String;
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                PermissionPage(mobileNumber: mobileNumber));
      case (RouteNames.login):
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignInScreen());

      case (RouteNames.onBoardingScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnBoardingScreen());

      case (RouteNames.otpScreen):
        final args = settings.arguments as Map<String, dynamic>;
        final String mobileNumber = args['mobileNumber'] as String;
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                OtpScreen(mobileNumber: mobileNumber));

      case (RouteNames.EmailScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const EmailVerificationScreen());


      case (RouteNames.setupAccountScreen):
        final args = settings.arguments as Map<String, dynamic>;
        final String emailID = args['emailId'] as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => SetUpAccount(emailID: emailID,));

      case (RouteNames.PanNumberScreen):
        final args = settings.arguments as Map<String, dynamic>;
        final String emailID = args['emailId'] as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => PanNumber(emailID: emailID,));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No route is configured"),
            ),
          ),
        );
    }
  }
}
