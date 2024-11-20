import 'package:deynamic_update/screen/auth/signin_screen.dart';
import 'package:deynamic_update/screen/onboarding/widgets/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared_preferences/shared_pref.dart';
import '../../utils/ConstentScreen.dart';
import '../../utils/constants/colors.dart';
import '../../utils/device/device_utility.dart';
import '../../utils/routes/routes_names.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;
  final List<Onboard> _onboardData = [
    Onboard(
      image: "assets/credit_card/images/bank.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_0.png",
      title: "One app for all financial\n needs ",
      description:
          "Enjoy ightning-fats cash up to\n Rs. 5lacs in just 2 minites",
    ),
    Onboard(
      image: "assets/credit_card/images/bank.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_1.png",
      title: "Instant Approval for all\n your credit need",
      description:
          "Enjoy ightning-fats cash up to\n Rs. 5lacs in just 2 minites",
    ),
    Onboard(
      image: "assets/credit_card/images/bank.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_2.png",
      title: "Enjoy Flexibility &\n convenience all in One!",
      description:
          "Enjoy ightning-fats cash up to\n Rs. 5lacs in just 2 minites",
    ),
  ];

  AnimatedContainer _buildDots({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFFFFFFFF),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 8,
    );
  }

  @override
  void initState() {
    TDeviceUtils.setNavBarColor(TColors.primary);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;
          return Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _onboardData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OnBoardingContent(
                      title: _onboardData[index].title,
                      description: _onboardData[index].description,
                      image: (Theme.of(context).brightness == Brightness.dark &&
                              _onboardData[index].imageDarkTheme != null)
                          ? _onboardData[index].imageDarkTheme!
                          : _onboardData[index].image,
                      isTextOnTop: false,
                    );
                  },
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onboardData.length,
                        (int index) => _buildDots(index: index),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: screenWidth, // use screen width
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.06, // 10% of screen width
                          right: screenWidth * 0.06, // 10% of screen width
                          bottom: screenHeight * 0.04, // 5% of screen height
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage + 1 == _onboardData.length) {
                              SharedPref.setBoolFuture(IS_show, true);
                              Navigator.pushReplacementNamed(
                                context,
                                RouteNames.login,
                              );
                            } else {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );
                              // Provider.of<ThemeModel>(context, listen: false).toggleTheme();
                            }
                          },
                          child: Text(
                            _currentPage + 1 == _onboardData.length
                                ? 'Get Started'
                                : 'Continue',
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
          );
        },
      ),
    );
  }
}

class Onboard {
  final String image, title, description;
  final String? imageDarkTheme;

  Onboard({
    required this.image,
    required this.title,
    this.description = "",
    this.imageDarkTheme,
  });
}
