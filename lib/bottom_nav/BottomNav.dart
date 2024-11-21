import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/UtilsClass.dart';
import '../AppHome/AppHomeScreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  ValueNotifier<int> bottomSelectedIndex = ValueNotifier<int>(0);
  PageController pageController = PageController(initialPage: 0);
  DateTime? lastBackPressed;

  List<BottomNavigationBarItem> bottomNavbarItem() {
    return [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_home.svg',
            semanticsLabel:"Home",
            color: bottomSelectedIndex.value == 0
                ? Color(0xFF4b68ff)
                : Colors.grey,
          ),
        label:"Home"
      ),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/transction.svg',
            semanticsLabel:"Loan",
            color: bottomSelectedIndex.value == 1
                ?  Color(0xFF4b68ff)
                : Colors.grey,
          ),
          label:"Loan"
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/loan.svg',
          semanticsLabel:"Transaction",
          color:
              bottomSelectedIndex.value == 2 ?  Color(0xFF4b68ff) : Colors.grey,
        ),
          label:"Transaction"
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/user_profile.svg',
          semanticsLabel:"Profile",
          color: bottomSelectedIndex.value == 3 ?  Color(0xFF4b68ff) : Colors.grey,
        ),
          label:"Profile"
      ),
    ];
  }



  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    bottomSelectedIndex = ValueNotifier<int>(0);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
        onPopInvokedWithResult: (context1, result) {
          if (bottomSelectedIndex.value != 0) {
            bottomSelectedIndex.value = 0;
            pageController.jumpToPage(0);
          } else {
            DateTime now = DateTime.now();
            if (lastBackPressed == null ||
                now.difference(lastBackPressed!) > Duration(seconds: 2)) {
              lastBackPressed = now;
              UtilsClass.showBottomToast("Press back again to exit" ?? "");
            } else {
              SystemNavigator.pop();
            }
          }

        },
      child: Scaffold(
          body: ValueListenableBuilder(
              valueListenable: bottomSelectedIndex,
              builder: (context, value, child) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  extendBody: true,
                  floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    iconSize: 25,
                    elevation: 5,
                    currentIndex: bottomSelectedIndex.value,
                    onTap: (value) {
                      bottomSelectedIndex.value = value;
                      pageController.animateToPage(value,
                          duration: const Duration(milliseconds: 5),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    items: bottomNavbarItem(),
                  ),
                  body: buildPageView(),
                );
              })),
    );
  }

  Widget buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (newValue) {
        FocusManager.instance.primaryFocus?.unfocus();
        bottomSelectedIndex.value = newValue;
      },
      children:  <Widget>[
        AppHomeScreen(),
        /*CategoriesScreen(),
        OfferScreen(),
        AllBrands()*/
      ],
    );
  }
}
