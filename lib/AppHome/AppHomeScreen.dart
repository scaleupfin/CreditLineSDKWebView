import 'package:carousel_slider/carousel_slider.dart';
import 'package:deynamic_update/AppHome/AppHomeDc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../api/FailureException.dart';
import '../provider/AppHomeDataProvider.dart';
import 'GoldenDealItemResModel.dart';

class AppHomeScreen extends StatefulWidget {
  AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen>
    with SingleTickerProviderStateMixin {
  late AppHomeDataProvider productProvider;
  List<AppHomeDc> getAppHomeDcList = [];

  var screenWidth;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getPublishedSection(context);
  }
  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<AppHomeDataProvider>(context, listen: false);


  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          // Aligns the title closer to the left
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            // Add padding for proper alignment
            child: Text(
              "Scaleup",
              style: GoogleFonts.urbanist(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2A51B1), // Blue color for the text
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color:
                    Color(0xFF2A51B1), // Customize the color of the bell icon
              ),
              onPressed: () {
                // Action when the bell icon is tapped
                print('Bell icon clicked');
              },
            ),
          ],
          elevation: 0, // Removes the shadow under the AppBar
        ),
        body: SafeArea(child: Scaffold(
          body: productProvider.isLoading?loadingWidget():SingleChildScrollView(
              child: Stack(children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: getAppHomeDcList.length,
                  itemBuilder: (context, index) {
                    return Text(getAppHomeDcList[index].appHomeHeading!);

                  },
                ),

              ],))
        )));
  }

  Future<void> _handleRefresh() async {
    productProvider.disposeHomePage();
    getPublishedSection(context);
  }

  Widget loadingWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, right: 8.0, left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.3,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.4,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.1,
                      height: 36, // Adjust the height based on your design
                      margin: const EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: screenWidth * 0.6,
                  height: 15, // Adjust the height based on your design
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40, // Adjust the height based on your design
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100, // Adjust the height based on your design
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 150, // Adjust the height based on your design
                        margin: const EdgeInsets.only(right: 4.0, bottom: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150, // Adjust the height based on your design
                        margin: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 150, // Adjust the height based on your design
                        margin: const EdgeInsets.only(right: 4.0, bottom: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150, // Adjust the height based on your design
                        margin: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 100, // Adjust the height based on your design
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100, // Adjust the height based on your design
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getPublishedSection(BuildContext context) {
    productProvider.GetPublishedSection();
    if (productProvider.getPublishedSection != null) {
      productProvider.getPublishedSection!.when(
        success: (data) {
          if (data.isSuccess!) {
            getAppHomeDcList = data.result!.appHomeDC!;

          }
        },
        failure: (exception) {
          if (exception is ApiException) {
            if (exception.statusCode == 401) {
              // Handle unauthorized error
            } else {
              // Handle other API errors
            }
          }
        },
      );
    }
    setState(() {});
  }
}
