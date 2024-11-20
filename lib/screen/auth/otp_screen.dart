import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:deynamic_update/screen/auth/email_verify_screen.dart';
import 'package:deynamic_update/screen/auth/model/OtpValidateModel.dart';
import 'package:deynamic_update/shared_preferences/shared_pref.dart';
import 'package:deynamic_update/utils/ConstentScreen.dart';
import 'package:deynamic_update/utils/UtilsClass.dart';
import 'package:deynamic_update/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../api/FailureException.dart';
import '../../provider/auth_provider.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';
import '../../utils/routes/routes_names.dart';
import '../../utils/validators/validation.dart';

class OtpScreen extends StatefulWidget {
  final String? mobileNumber;

  const OtpScreen(
      {super.key, this.mobileNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  final CountDownController _controller = CountDownController();
  bool _isButtonTapped = true;
  bool _isEnabled = false;
  int _duration = 30;


  @override
  void initState() {
    _controller.start();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
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
                      'OTP sent on XXXXXXX${UtilsClass.getLastFour(widget.mobileNumber!)}',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextButton(
                              onPressed: _isEnabled
                                  ? () {
                                callGenrateOtpApi(context);
                                setState(() {
                                  _duration = 45;
                                  _isEnabled = false;
                                  _otpController.clear();
                                  _controller.restart(duration: _duration);
                                });
                              }
                                  : null,
                              child: const Text(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: TColors.primary,
                                  ),
                                  "Resend otp"))),
                      const SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: CircularCountDownTimer(
                          duration: _duration,
                          initialDuration: 0,
                          controller: _controller,
                          width: 25,
                          height: 25,
                          ringColor: Colors.grey[300]!,
                          ringGradient: null,
                          fillColor: TColors.primary,
                          fillGradient: null,
                          backgroundColor: Colors.white,
                          backgroundGradient: null,
                          strokeWidth: 5.0,
                          strokeCap: StrokeCap.round,
                          textStyle: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                          textFormat: CountdownTextFormat.S,
                          isReverse: true,
                          isReverseAnimation: true,
                          isTimerTextShown: true,
                          autoStart: true,
                          onStart: () {
                            debugPrint('Countdown Started');
                          },
                          onComplete: () {
                            debugPrint('Countdown Ended');
                            setState(() {
                              _isEnabled = true;
                              _controller.reset();
                            });
                          },
                          onChange: (String timeStamp) {
                            // debugPrint('Countdown Changed $timeStamp');
                          },
                          timeFormatterFunction: (defaultFormatterFunction, duration) {
                            if (duration.inSeconds == 0) {
                              return duration.inSeconds;
                            } else {
                              return Function.apply(
                                  defaultFormatterFunction, [duration]);
                            }
                          },
                        ),
                      ),
                    ],),
                    const SizedBox(height: 22),
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
                            _isButtonTapped = false;
                            authProvider.setLoading(true);
                            TDeviceUtils.hideKeyboard(context);
                            validateOtp(context,_otpController,authProvider);
                          },
                          child: authProvider.isLoading
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

  void callGenrateOtpApi(BuildContext context, )async {
    //authProvider.setLoading(false);
    UtilsClass.onLoading(context, "");
    await Provider.of<AuthProvider>(context, listen: false).fetchOtpData(widget.mobileNumber!);
    final productProvider = Provider.of<AuthProvider>(context, listen: false);
    if (productProvider.getFetchOtpData != null) {
      Navigator.of(context, rootNavigator: true).pop();
      productProvider.getFetchOtpData!.when(
        success: (otpResponceModel) async {
          if (otpResponceModel.status!) {
            SharedPref.saveString(MOBILE_NUMBER,widget.mobileNumber!);
            UtilsClass.showBottomToast("Genrate Otp");

          } else {
            UtilsClass.showBottomToast(otpResponceModel.message!);
          }
        },
        failure: (exception) {
          if (exception is ApiException) {
            if (exception.statusCode == 401) {
              UtilsClass.showBottomToast(exception.errorMessage);
              //ApiService().handle401(context);
            }
          }
        },
      );
    }

  }

  void validateOtp(BuildContext context, TextEditingController otpController,AuthProvider authProvider)async {
    await Provider.of<AuthProvider>(context, listen: false).otpValidateData(OtpValidateModel(mobileNo: widget.mobileNumber,otp: otpController.text.toString().trim()));
    final productProvider = Provider.of<AuthProvider>(context, listen: false);
    if (productProvider.getOtpValidateData != null) {
      // Navigator.of(context, rootNavigator: true).pop();
      productProvider.getOtpValidateData!.when(
        success: (otpResponceModel) async {
          _isButtonTapped = true;
          authProvider.setLoading(false);
          if (otpResponceModel.status!) {
            SharedPref.saveString(USER_ID, otpResponceModel.userId!);
            SharedPref.saveString(TOKEN, otpResponceModel.userTokan!);
            SharedPref.saveBool(Is_Login, true);
            Navigator.pushReplacementNamed(
              context,
              RouteNames.EmailScreen,
            );
          } else {
            UtilsClass.showBottomToast(otpResponceModel.message!);
          }
        },
        failure: (exception) {
          _isButtonTapped = true;
          authProvider.setLoading(false);
          if (exception is ApiException) {
            if (exception.statusCode == 401) {
              UtilsClass.showBottomToast(exception.errorMessage);
              //ApiService().handle401(context);
            }
          }
        },
      );
    }
  }
}
