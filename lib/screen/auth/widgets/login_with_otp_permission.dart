import 'package:deynamic_update/screen/auth/widgets/phone_state_permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scale_up_module/view/pancard_screen/PermissionsScreen.dart';

import '../../../provider/auth_provider.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../otp_screen.dart';

class LoginWithOtpPermission extends StatelessWidget {
  const LoginWithOtpPermission({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return LayoutBuilder(builder: (context, constraints) {
      final screenWidth = constraints.maxWidth;
      final screenHeight = constraints.maxHeight;
      return Container(
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/credit_card/icons/chat_icon.svg',
                  semanticsLabel: 'like',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Are you sure you don't want to verify your device?",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.urbanist(
                    fontSize: 20, // 5% of screen width
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "\u2022 ",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.urbanist(
                        fontSize: 36, // 5% of screen width
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "You won't be able to use your PayLater limit for larger transactions",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.urbanist(
                          fontSize: 15, // 5% of screen width
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "\u2022 ",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.urbanist(
                        fontSize: 36, // 5% of screen width
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "You may put yourself at risk for fraud",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.urbanist(
                          fontSize: 15, // 5% of screen width
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth, // use screen width
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: screenHeight * 0.02, // 5% of screen height
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OtpScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: TColors.light,
                        backgroundColor: TColors.grey2,
                        disabledForegroundColor: TColors.darkGrey,
                        disabledBackgroundColor: TColors.buttonDisabled,
                        //side: const BorderSide(color: TColors.primaryButtonColor),
                        padding: const EdgeInsets.symmetric(
                            vertical: TSizes.buttonHeight),
                        textStyle: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(TSizes.buttonRadius)),
                      ),
                      child: Text(
                        'Yes, login with OTP',
                        style: GoogleFonts.urbanist(
                          fontSize: 18,
                          color: TColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth, // use screen width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showBottomSheet(
                          showDragHandle: false,
                          context: context,
                          builder: (builder) {
                            return const PhoneStatePermission();
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: TColors.light,
                      backgroundColor: TColors.primaryButtonColor,
                      disabledForegroundColor: TColors.darkGrey,
                      disabledBackgroundColor: TColors.buttonDisabled,
                      //side: const BorderSide(color: TColors.primaryButtonColor),
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.buttonHeight),
                      textStyle: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(TSizes.buttonRadius)),
                    ),
                    child: Text(
                      'No, continue verification',
                      style: GoogleFonts.urbanist(
                        fontSize: 18, // 5% of screen width
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      );
    });
  }
}
