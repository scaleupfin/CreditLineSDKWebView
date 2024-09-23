import 'package:deynamic_update/screen/auth/widgets/login_with_otp_permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class PhoneStatePermission extends StatelessWidget {
  const PhoneStatePermission({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                      "Phone State permission",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.urbanist(
                        fontSize: 20, // 5% of screen width
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Scaleup needs phone state permission to verify your SIM",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.urbanist(
                        fontSize: 15, // 5% of screen width
                        fontWeight: FontWeight.w400,
                      ),
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
                            showBottomSheet(
                                showDragHandle: false,
                                context: context,
                                builder: (builder) {
                                  return const LoginWithOtpPermission();
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            foregroundColor: TColors.light,
                            backgroundColor: TColors.grey2,
                            disabledForegroundColor: TColors.darkGrey,
                            disabledBackgroundColor: TColors.buttonDisabled,
                            //side: const BorderSide(color: TColors.primaryButtonColor),
                            padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
                            textStyle: GoogleFonts.urbanist(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
                          ),
                          child: Text(
                            'Don’t verified this device ',
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

                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: TColors.light,
                          backgroundColor: TColors.primaryButtonColor,
                          disabledForegroundColor: TColors.darkGrey,
                          disabledBackgroundColor: TColors.buttonDisabled,
                          //side: const BorderSide(color: TColors.primaryButtonColor),
                          padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
                          textStyle: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
                        ),
                        child: Text(
                          'Grant permissions',
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
