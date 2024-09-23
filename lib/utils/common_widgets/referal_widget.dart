import 'package:deynamic_update/screen/auth/widgets/login_with_otp_permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../validators/validation.dart';

class ReferralWidget extends StatelessWidget {
  ReferralWidget({super.key});

  final _referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final screenWidth = constraints.maxWidth;
      final screenHeight = constraints.maxHeight;
      return Container(
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: TColors.grey),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/credit_card/icons/lock_icon.svg',
                  semanticsLabel: 'like',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter referral code",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.urbanist(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Get Rs. 300 directly in your bank account after loan disbursal",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.urbanist(
                    fontSize: 15, // 5% of screen width
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.01, // 10% of screen width
                    right: screenWidth * 0.01, // 10% of screen width
                  ),
                  child: TextFormField(
                      style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: TColors.black,
                      ),
                      controller: _referralCodeController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [LengthLimitingTextInputFormatter(20)],
                      decoration: InputDecoration(
                        hintText: 'Enter Code',
                        hintStyle: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: TColors.darkGrey,
                        ),
                        filled: true,
                        fillColor: TColors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: TSizes.buttonHeight, horizontal: 20.0),
                      ),
                      validator: TValidator.validatePhoneNumber),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth, // use screen width
                  child: ElevatedButton(
                    onPressed: () {},
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
                      'Apply code',
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
