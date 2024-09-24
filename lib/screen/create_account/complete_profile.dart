import 'package:deynamic_update/screen/create_account/setup_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';


class CompleteProfile extends StatefulWidget {

  const CompleteProfile( {super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
     return Scaffold(
      backgroundColor: TColors.primary,
      body: SafeArea( // Wrap with SafeArea
        top: true,
        bottom: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight, // Ensures the scrollable content takes up the full screen height
                ),
                child: IntrinsicHeight(
                  child:Column(
                    children: <Widget>[
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.06, // 6% of screen width
                          vertical: screenHeight * 0.04, // 4% of screen height
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 10),
                            Image.asset('assets/credit_card/images/ic_create_account_emoji.png',
                              width: screenWidth * 0.5,
                              height: screenHeight * 0.3,
                              alignment: Alignment.topLeft,
                            ),
                            Text(
                              'Your account is ready now!',
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: TColors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Complete your profile to get a personalized offer',
                              style: GoogleFonts.urbanist(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: TColors.white,
                              ),
                            ),
                            const SizedBox(height: 34),

                            SizedBox(
                              width: screenWidth, // use screen width
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.00, // 6% of screen width
                                  vertical: screenHeight * 0.03, // 4% of screen height
                                ),
                                child: ElevatedButton(
                                  onPressed: () {

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SetUpAccount()));

                                  },
                                  child: Text(
                                    "Complete Profile",
                                    style: GoogleFonts.urbanist(
                                      fontSize: 18, // 18pt font size
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'I’ll do it Later',
                                style: GoogleFonts.urbanist(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: TColors.white,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ), // Your widget here
                ),
              ),
            );
          },
        ),
      ),
    );;
  }
}
