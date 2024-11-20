import 'package:deynamic_update/screen/create_account/pan_number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';
import '../../utils/routes/routes_names.dart';

class SetUpAccount extends StatefulWidget {
  final String? emailID;
  const SetUpAccount(
      {super.key, this.emailID});

  @override
  State<SetUpAccount> createState() => _SetUpAccountState();
}

class _SetUpAccountState extends State<SetUpAccount> {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: TColors.primary,
      body: SafeArea(
        // Wrap with SafeArea
        top: true,
        bottom: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      screenHeight, // Ensures the scrollable content takes up the full screen height
                ),
                child: IntrinsicHeight(
                  child: Column(
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
                            Image.asset(
                              'assets/credit_card/images/ic_create_account_emoji.png',
                              width: screenWidth * 0.5,
                              height: screenHeight * 0.3,
                              alignment: Alignment.topLeft,
                            ),
                            Text(
                              'Hi, I’m Scalup',
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: TColors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Your Friend, in this ride of your\nnext upgrade!',
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: TColors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'All your epic upgrades are just a few steps away',
                              style: GoogleFonts.urbanist(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: TColors.white,
                              ),
                            ),
                            // This will push the widgets below it to the bottom
                            const SizedBox(height: 34),

                            SizedBox(
                              width: screenWidth, // Use screen width
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.00,
                                  // 0% of screen width
                                  vertical: screenHeight *
                                      0.03, // 3% of screen height
                                ),
                                child: ElevatedButton(
                                  onPressed: () {

                                    Navigator.pushReplacementNamed(
                                      context,
                                      RouteNames.PanNumberScreen,
                                      arguments: {
                                        'emailId': widget.emailID,
                                      },
                                    );
                                   /* Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PanNumber(),
                                      ),
                                    );*/
                                  },
                                  child: Text(
                                    "Setup account",
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
                                'Have referral code?',
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
    );
    ;
  }
}
