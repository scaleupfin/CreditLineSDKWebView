import 'package:deynamic_update/utils/common_widgets/referal_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/routes/routes_names.dart';
import '../create_account/setup_account.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;
  User? user;

  @override
  void initState() {
    super.initState();
  }

  Future<void> signInWithGoogle() async {
    setState(() {
      isLoading = true; // Show loader
    });

    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      user = userCredential.user;

      Navigator.pushReplacementNamed(
        context,
        RouteNames.setupAccountScreen,
        arguments: {
          'emailId': user!.email,
        },
      );

      print("Bhagwan${user!.email}");
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        isLoading = false; // Hide loader
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        return Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                color: TColors.primary,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
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
              ),
              Container(
                  color: TColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Verification Your Email',
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Only important, updates we promise’.',
                              style: GoogleFonts.urbanist(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF828282),
                              ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () {
                                signInWithGoogle();
                              },
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      TSizes.buttonRadius),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/credit_card/images/flag.png",
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      'Continue with Google',
                                      style: GoogleFonts.urbanist(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF828282),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            if (isLoading)
                              Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.3,
                        ),
                        TextButton(
                          onPressed: () {
                            showBottomSheet(
                                showDragHandle: false,
                                context: context,
                                builder: (builder) {
                                  return ReferralWidget();
                                });
                          },
                          child: Text(
                            'Have referral code?',
                            style: GoogleFonts.urbanist(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: TColors.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ]),
          ),
        );
      }),
    );
  }
}
