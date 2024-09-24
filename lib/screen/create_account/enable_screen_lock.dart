import 'package:deynamic_update/screen/create_account/pan_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';

class EnableScreenLock extends StatefulWidget {
  const EnableScreenLock({super.key});

  @override
  State<EnableScreenLock> createState() => _EnableScreenLockState();
}

class _EnableScreenLockState extends State<EnableScreenLock> {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
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
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.06, // 6% of screen width
                          vertical: screenHeight * 0.04, // 4% of screen height
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 10),
                            SvgPicture.asset(
                              'assets/credit_card/images/screen_lock.svg',
                              semanticsLabel: 'like',
                            ),
                            const SizedBox(height: 22),
                            Text(
                              'Enable screen lock',
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: TColors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Secure your app so that only you can \n use it',
                              style: GoogleFonts.urbanist(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: TColors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            // This will push the widgets below it to the bottom
                            const SizedBox(height: 125),

                            SizedBox(
                              width: screenWidth, // Use screen width
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.00, // 0% of screen width
                                  vertical: screenHeight * 0.03, // 3% of screen height
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PanNumber(
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Enable Screen Lock",
                                    style: GoogleFonts.urbanist(
                                      fontSize: 18, // 18pt font size
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
