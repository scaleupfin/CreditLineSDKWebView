import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants/colors.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    this.isTextOnTop = false,
    required this.title,
    required this.description,
    required this.image,
  });

  final bool isTextOnTop;
  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        return Column(
          children: [
            const Spacer(),
            Image.asset(
              image,
              width: screenWidth * 0.8, // 80% of screen width
              height: screenHeight * 0.5, // 40% of screen height
            ),
            const Spacer(),
            OnBordTitleDescription(
              title: title,
              description: description,
              titleStyle: GoogleFonts.urbanist(
                fontSize: screenWidth * 0.05, // 5% of screen width
                fontWeight: FontWeight.bold,
                color: TColors.white
              ),
              descriptionStyle: GoogleFonts.urbanist(
                fontSize: screenWidth * 0.04, // 4% of screen width
                  color: TColors.white
              ),
            ),
          ],
        );
      },
    );
  }
}

class OnBordTitleDescription extends StatelessWidget {
  const OnBordTitleDescription({
    super.key,
    required this.title,
    required this.description,
    this.titleStyle,
    this.descriptionStyle,
  });

  final String title, description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 10% of screen width
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle ?? GoogleFonts.urbanist(
                  fontSize: screenWidth * 0.06, // 5% of screen width
                  fontWeight: FontWeight.w600,
                  color: TColors.white,
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.02), // 2% of screen width
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 10% of screen width
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: descriptionStyle ?? GoogleFonts.urbanist(
                  fontSize: screenWidth * 0.04, // 4% of screen width
                  fontWeight: FontWeight.w400,
                  color: TColors.white,
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.08), // 8% of screen width
          ],
        );
      },
    );
  }
}
