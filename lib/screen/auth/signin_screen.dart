import 'package:deynamic_update/provider/auth_provider.dart';
import 'package:deynamic_update/screen/auth/otp_screen.dart';
import 'package:deynamic_update/utils/validators/validation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../utils/common_widgets/PermissionPage.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  bool _isButtonTapped = true;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    TDeviceUtils.setNavBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: TColors.primary,
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: height * 0.07), // Top spacing
                    Center(
                      child: Image.asset(
                        "assets/credit_card/images/bank.png",
                        width: screenWidth * 0.7,
                        // 70% of screen width
                        height: screenHeight * 0.3, // 30% of screen height
                      ),
                    ),
                    const SizedBox(height: 24), // Space between image and text
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.06, // 10% of screen width
                        right: screenWidth * 0.06, // 10% of screen width
                      ),
                      child: Text(
                        'Let\'s Get Started! ${authProvider.isAuthorized}',
                        style: GoogleFonts.urbanist(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: TColors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.06, // 10% of screen width
                        right: screenWidth * 0.06, // 10% of screen width
                      ),
                      child: Text(
                        'Enter your mobile number',
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: TColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.06, // 10% of screen width
                        right: screenWidth * 0.06, // 10% of screen width
                      ),
                      child: TextFormField(
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: TColors.black,
                          ),
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp((r'[0-9]'))),
                            LengthLimitingTextInputFormatter(10)
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0, left: 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    "assets/credit_card/images/flag.png",
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '+91',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: TColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            hintText: 'Enter your mobile number',
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
                                vertical: TSizes.buttonHeight),
                          ),
                          validator: TValidator.validatePhoneNumber),
                    ),
                    SizedBox(height: height * 0.05),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.03, // 10% of screen width
                        right: screenWidth * 0.03, // 10% of screen width
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: authProvider.sendReminders,
                            onChanged: (value) {
                              context
                                  .read<AuthProvider>()
                                  .setSendReminders(value ?? false);
                            },
                            fillColor:
                                WidgetStateProperty.resolveWith((states) {
                              return TColors.white;
                            }),
                            activeColor: TColors.white,
                            checkColor: TColors.primary,
                            side: const BorderSide(
                              color: TColors.white,
                              width: 1.5,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'By authorizing Scaleup, I can view my full loan account details, bill and credit information sourced from RBI-approved bureaus and lenders.',
                              style: GoogleFonts.urbanist(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: TColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.03, // 10% of screen width
                        right: screenWidth * 0.03, // 10% of screen width
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: authProvider.isAuthorized,
                            onChanged: (value) {
                              context
                                  .read<AuthProvider>()
                                  .setAuthorized(value ?? false);
                            },
                            fillColor:
                                WidgetStateProperty.resolveWith((states) {
                              return TColors.white;
                            }),
                            activeColor: TColors.white,
                            checkColor: TColors.primary,
                            side: const BorderSide(
                              color: TColors.white,
                              width: 1.5,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Send me bill and payment reminders on WhatsApp',
                              style: GoogleFonts.urbanist(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: TColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.06, // 10% of screen width
                        right: screenWidth * 0.06, // 10% of screen width
                      ),
                      child: const Divider(thickness: 1, color: TColors.grey1),
                    ),
                    SizedBox(height: height * 0.02),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.06, // 10% of screen width
                        right: screenWidth * 0.06, // 10% of screen width
                      ),
                      child: Text(
                        'By proceeding, you agree to Scalup terms-of-service and privacy policy',
                        style: GoogleFonts.urbanist(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: TColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    SizedBox(
                      width: screenWidth, // use screen width
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.06, // 10% of screen width
                          right: screenWidth * 0.06, // 10% of screen width
                          bottom: screenHeight * 0.06, // 5% of screen height
                        ),
                        child: ElevatedButton(
                          onPressed: authProvider.isButtonEnabled &&
                                  _formKey.currentState!.validate()
                              ? () async {
                                  if (_isButtonTapped) {
                                    _isButtonTapped = false;
                                    TDeviceUtils.hideKeyboard(context);
                                    authProvider.setLoading(true);
                                    PermissionStatus cameraPermissionStatus =
                                        await Permission.camera.status;
                                    PermissionStatus
                                        microphonePermissionStatus =
                                        await Permission.microphone.status;
                                    PermissionStatus smsPermissionStatus =
                                        await Permission.sms.status;

                                    if (cameraPermissionStatus.isGranted &&
                                        microphonePermissionStatus.isGranted &&
                                        smsPermissionStatus.isGranted) {
                                      await _handleGetOtp(authProvider);
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PermissionPage()),
                                      );
                                    }
                                  }
                                }
                              : null,
                          child: authProvider.isButtonEnabled &&
                                  _formKey.currentState!.validate() &&
                                  authProvider.isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'GET OTP',
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
            ),
          );
        },
      ),
    );
  }

  Future<void> _handleGetOtp(AuthProvider authProvider) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OtpScreen()));
      if (kDebugMode) {
        print('OTP sent');
        print('Phone number: ${_phoneNumberController.text}');
      }
    } finally {
      authProvider.setLoading(false);
    }
    _isButtonTapped = true;
  }
}
