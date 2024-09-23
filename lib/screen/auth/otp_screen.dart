import 'package:deynamic_update/screen/auth/email_verify_screen.dart';
import 'package:deynamic_update/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';
import '../../utils/validators/validation.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  bool _isButtonTapped = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: TColors.primary,
                padding: const EdgeInsets.only(
                    top: 50, left: 16, right: 16, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 32),
                    const Center(
                      child: Icon(
                        Icons.mail_outline,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Get instant cash for instant \nupgrades',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: TColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 30.0, right: 30.0, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verification mobile number',
                      style: GoogleFonts.urbanist(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: TColors.black,
                      ),
                    ),
                    Text(
                      'OTP sent on XXXXXXX1252',
                      style: GoogleFonts.urbanist(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: TColors.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 24),
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
                          controller: _otpController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp((r'[0-9]'))),
                            LengthLimitingTextInputFormatter(6)
                          ],
                          decoration: InputDecoration(
                            hintText: 'Enter OTP',
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
                                vertical: TSizes.buttonHeight,
                                horizontal: 20.0),
                          ),
                          validator: TValidator.validatePhoneNumber),
                    ),
                    const SizedBox(height: 22),
                    Center(
                      child: Text(
                        'Resent OTP in 43 Sec',
                        style: GoogleFonts.urbanist(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: screenWidth, // use screen width
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.01, // 10% of screen width
                          right: screenWidth * 0.01, // 10% of screen width
                          bottom: screenHeight * 0.06, // 5% of screen height
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            TDeviceUtils.hideKeyboard(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EmailVerificationScreen()));
                          },
                          child: !_isButtonTapped
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'Verify OTP',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 18, // 5% of screen width
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
