import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scale_up_module/main.dart';
import 'package:scale_up_module/utils/loader.dart';
import 'package:shimmer/shimmer.dart';

import '../api/FailureException.dart';
import '../data_provider/AppHomeDataProvider.dart';
import 'GetPublishedSectionResModel.dart';
import 'GoldenDealItemResModel.dart';

class AppHomeScreen extends StatefulWidget {
  AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen>
    with SingleTickerProviderStateMixin {
  var isLoading = true;

  List<Data> getPublishedSectionResModelList = [];
  List<ItemDataDCs> itemDataDCsList = [];
  List<AppItemsList> appItemsList = [];

  int _current = 0;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // API Call
    GetPublishedSection(context);

    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Consumer<AppHomeDataProvider>(
            builder: (context, productProvider, child) {
          if (productProvider.getPublishedSection == null && isLoading) {
            return _buildShimmerEffect();
          } else {
            if (productProvider.getPublishedSection != null && isLoading) {
              // Navigator.of(context, rootNavigator: true).pop();
              isLoading = false;
            }

            if (productProvider.getPublishedSection != null) {
              productProvider.getPublishedSection!.when(
                success: (data) {
                  if (data.data!.isNotEmpty) {
                    getPublishedSectionResModelList.clear();
                    getPublishedSectionResModelList.addAll(data.data!);

                    print("appItemsList size: ${appItemsList.length}");
                    print(
                        "PublishedSectionList size: ${getPublishedSectionResModelList.length}");
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

            if (productProvider.getGoldenDealItemData != null) {
              productProvider.getGoldenDealItemData!.when(
                success: (data) {
                  if (data.data!.itemDataDCs!.isNotEmpty) {
                    itemDataDCsList.clear();
                    itemDataDCsList.addAll(
                        data.data!.itemDataDCs as Iterable<ItemDataDCs>);

                    print("appItemsList size: ${itemDataDCsList.length}");
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
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    child:
                        _myListView(context, getPublishedSectionResModelList),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Future<void> GetPublishedSection(BuildContext context) async {
    Provider.of<AppHomeDataProvider>(context, listen: false)
        .GetPublishedSection(
      "RetailerApp",
      202699,
      1,
      "en",
      0.0,
      0.0,
    );

    Provider.of<AppHomeDataProvider>(context, listen: false).GetGoldenDealItem(
      202699,
      1,
      "en",
      0,
      4,
    );
  }

  Widget _myListView(BuildContext context, List<Data> dataList) {
    if (dataList.isEmpty) {
      return Center(
        child: Text('No sections available'),
      );
    }

    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        Data section = dataList[index];
        return Column(
          children: [
            if (section.sectionType == "Banner" && section.appItemsList != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_current == 0) {
                          Map<String, dynamic> json = {
                            "mobileNumber": "8959311437",
                            "companyID": "CompanyID123",
                            "productID": "ProductID123",
                            "transactionId": "",
                            "isPayNow": false,
                            "baseUrl": "https://gateway-qa.scaleupfin.com"
                          };

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyApp(data: json);
                              },
                            ),
                          );
                        }
                      },
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          initialPage: 0,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          reverse: false,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 2000),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });

                            _animationController.forward(from: 10.0);
                          },
                          viewportFraction: 1.0,
                        ),
                        items: section.appItemsList!.map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      item.bannerImage.toString(),
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 200.0,
                                              color: Colors.white,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 0.0,
                      right: 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            map<Widget>(section.appItemsList!, (index, url) {
                          return Container(
                            width: 5.0,
                            height: 5.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              )
            else if (section.sectionType == "Tile" &&
                section.appItemsList != null)
              _myGridView(section.appItemsList!)
            else
              verticalListView(itemDataDCsList),
            // Handle other section types or empty state
          ],
        );
      },
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          _GridViewShimmerEffect(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _GridViewShimmerEffect() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 10.0, // Space between columns
          mainAxisSpacing: 10.0, // Space between rows
        ),
        itemCount: 9, // Number of shimmer items to display
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Container());
        },
      ),
    );
  }

  Widget _myGridView(List<AppItemsList> itemsList) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 5, // Spacing between columns
        mainAxisSpacing: 5, // Spacing between rows
      ),
      itemCount: itemsList.length,
      // Number of items based on data
      itemBuilder: (context, index) {
        AppItemsList item = itemsList[index];
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Image.network(
                    item.tileImage.toString(),
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: 80,
                          ),
                        );
                      }
                    },
                  ),
                ),
                Flexible(
                  child: Text(
                    item.tileName ?? 'Item $index',
                    // Assuming there's a name field
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      // Allows GridView to take only the required height
      physics:
          NeverScrollableScrollPhysics(), // Prevents GridView from scrolling inside ListView
    );
  }

  Widget horizontalListView() {
    return Container(
      height: 200, // Set a fixed height for the horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.vertical, // Scroll direction is horizontal
        itemCount: 20, // Number of items
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            // Width of each item
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text(
              'Item $index',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
      ),
    );
  }

  Widget verticalListView(List<ItemDataDCs> itemDataDCs) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemDataDCs.length,
        itemBuilder: (context, index) {
          ItemDataDCs item = itemDataDCs[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      height: 120,
                      width: 140,
                      child: Image.network(
                        item.logoUrl.toString(),
                        fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                                width: 140,
                                height: 120,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                item.itemname.toString(),
                                // Assuming there's a name field
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/ic_Like_heart.svg',
                              semanticsLabel: 'like',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          "MRP : ${item.price.toString()}",
                          // Assuming there's a price field
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/ic_star.svg',
                          semanticsLabel: 'star',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> json = {
                  "mobileNumber": "8959311437",
                  "companyID": "CompanyID123",
                  "productID": "ProductID123",
                  "transactionId": "",
                  "isPayNow": false,
                  "baseUrl": "https://gateway-qa.scaleupfin.com"
                };

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyApp(data: json);
                    },
                  ),
                );
              },
              child: Text('Business Loan'),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Supply Chan finance'),
            )
          ],
        ),
      ),
    );
  }
}
