import 'package:deynamic_update/screen/auth/otp_screen.dart';
import 'package:deynamic_update/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/sizes.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  _PermissionPageState createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage>
    with WidgetsBindingObserver {
  bool _cameraGranted = false;
  bool _microphoneGranted = false;
  bool _smsGranted = false;
  bool _permissionsRequested = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (WidgetsBinding.instance.lifecycleState != null) {
      _checkPermission();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _checkPermission();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 0.0, bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 44.0),
                        child: Text(
                          'Please Allow Access',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.urbanist(
                            fontSize: 22,
                            color: TColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'To enhance your experience on MyApp',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          color: TColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildPermissionItem(
                          granted: _smsGranted,
                          title: 'SMS Permission',
                          description: 'To detect due bills',
                          isMandatory: true,
                          icon: "assets/credit_card/icons/sms_edit_icon.svg"),
                      _buildPermissionItem(
                          granted: _microphoneGranted,
                          title: 'Microphone Permission',
                          description: 'To record audio',
                          isMandatory: true,
                          icon: "assets/credit_card/icons/microphone_icon.svg"),
                      _buildPermissionItem(
                          granted: _cameraGranted,
                          title: 'Notification',
                          description: 'Notification',
                          isMandatory: true,
                          icon:
                              "assets/credit_card/icons/notification_icon.svg"),
                      _buildPermissionItem(
                          granted: _cameraGranted,
                          title: 'Location',
                          description: 'Location',
                          isMandatory: true,
                          icon: "assets/credit_card/icons/location_icon.svg"),
                      _buildPermissionItem(
                          granted: _smsGranted,
                          title: 'Auto Fetch Permission',
                          description: 'To detect generated bills instantly',
                          isMandatory: true,
                          icon: "assets/credit_card/icons/sms_edit_icon.svg"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              // Adjust this value if you need more or less space
              left: 0.0,
              // Adjust these values to position the button horizontally
              right: 0.0,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 24.0, bottom: 8.0),
                  child: Column(
                    children: [
                      Text(
                        "Your information is 100% safe and secure ",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.urbanist(
                          fontSize: 10,
                          color: TColors.darkGrey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                foregroundColor: TColors.light,
                                backgroundColor: TColors.white,
                                disabledForegroundColor: TColors.darkGrey,
                                disabledBackgroundColor: TColors.buttonDisabled,
                                side: const BorderSide(color: TColors.grey1),
                                padding: const EdgeInsets.symmetric(
                                    vertical: TSizes.buttonHeight),
                                textStyle: GoogleFonts.urbanist(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        TSizes.buttonRadius)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  'Skip',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF828282),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16,),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtpScreen()));
                               /* if (_cameraGranted &&
                                    _microphoneGranted &&
                                    _smsGranted) {
                                  //  _navigateToHome(dataProvider);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OtpScreen()));
                                } else {
                                  _requestPermissions();
                                }*/
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                foregroundColor: TColors.light,
                                backgroundColor: TColors.primaryButtonColor,
                                disabledForegroundColor: TColors.darkGrey,
                                disabledBackgroundColor: TColors.buttonDisabled,
                                padding: const EdgeInsets.symmetric(
                                    vertical: TSizes.buttonHeight),
                                textStyle: GoogleFonts.urbanist(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        TSizes.buttonRadius)),
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  _permissionsRequested &&
                                          _cameraGranted &&
                                          _microphoneGranted &&
                                          _smsGranted
                                      ? 'Continue'
                                      : 'Allow Access',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkPermission() async {
    PermissionStatus cameraPermissionStatus = await Permission.camera.status;
    PermissionStatus microphonePermissionStatus =
        await Permission.microphone.status;
    PermissionStatus smsPermissionStatus = await Permission.sms.status;

    if (cameraPermissionStatus.isGranted) {
      _cameraGranted = true;
    }

    if (microphonePermissionStatus.isGranted) {
      _microphoneGranted = true;
    }

    if (smsPermissionStatus.isGranted) {
      _smsGranted = true;
    }
    setState(() {});
  }

  Future<void> _requestPermissions() async {
    setState(() {
      _permissionsRequested = true;
    });
    _cameraGranted = await _requestPermission(Permission.camera);
    _microphoneGranted = await _requestPermission(Permission.microphone);
    _smsGranted = await _requestPermission(Permission.sms);
  }

  Future<bool> _requestPermission(Permission permission) async {
    var status = await permission.status;
    if (status.isDenied || status.isRestricted) {
      final permissionStatus = await permission.request();
      return permissionStatus.isGranted;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    setState(() {});
    return status.isGranted;
  }

  /*void _navigateToHome(DataProvider dataProvider) async {
    final prefsUtil = await SharedPref.getInstance();
    var mobileNumber = await prefsUtil.getString(LOGIN_MOBILE_NUMBER);
    Utils.onLoading(context, "");
    await Provider.of<DataProvider>(context, listen: false)
        .genrateOtp(context, mobileNumber!);
    if (dataProvider.genrateOptData != null) {
      Navigator.of(context, rootNavigator: true).pop();
      dataProvider.genrateOptData!.when(
        success: (data) async {
          if (!data.status!) {
            Utils.showToast(data.message!, context);
          } else {
            var mixpanelData = {
              'Button Name': 'Continue',
              'Screen': 'Permission Screen',
              'Mobile Number': mobileNumber,
            };
            MixpanelManager()
                .trackEvent(MixpannelEventName.otpSent, mixpanelData);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const OtpScreen();
                },
              ),
            );
          }
        },
        failure: (exception) {},
      );
    }
    dataProvider.disposeAllProviderData();
  }*/

  Widget _buildPermissionItem({
    required bool granted,
    required String title,
    required String description,
    required bool isMandatory,
    required String icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: Stack(
        children: [
          Container(
            /*decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xff0196CE))),*/
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
              child: Row(
                children: [
                  Container(
                    width: 40, // Set the desired width
                    height: 40,
                    child: SvgPicture.asset(
                      icon,
                      semanticsLabel: 'like',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                title,
                                style: GoogleFonts.urbanist(
                                  fontSize: 18,
                                  color: TColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          description,
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            color: TColors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    granted ? Icons.check : Icons.warning_amber_rounded,
                    color: granted ? Colors.green.shade300 : Colors.white,
                  ),
                ],
              ),
            ),
          ),
          if (!isMandatory)
            Positioned(
              top: 0, // Adjust as needed
              right: 10, // Adjust as needed
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'MANDATORY',
                  style: GoogleFonts.urbanist(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
