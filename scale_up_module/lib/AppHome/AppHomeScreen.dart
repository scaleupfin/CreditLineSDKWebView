import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../data_provider/DataProvider.dart';
import '../api/FailureException.dart';
import 'GetPublishedSectionResModel.dart';
import 'GoldenDealItemResModel.dart';

class AppHomeScreen extends StatefulWidget {
  AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  var isLoading = false;

  List<Data> getPublishedSectionResModelList = [];
  List<ItemDataDCs> itemDataDCsList = [];
  List<AppItemsList> appItemsList = [];

  int _current = 0;

  @override
  void initState() {
    super.initState();
    // API Call
    GetPublishedSection(context);
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
      body: SafeArea(
        child: Consumer<DataProvider>(builder: (context, productProvider, child) {
          if (productProvider.getPublishedSection != null) {
            productProvider.getPublishedSection!.when(
              success: (data) {
                if (data.data!.isNotEmpty) {
                  getPublishedSectionResModelList.clear();
                  getPublishedSectionResModelList.addAll(data.data!);

                /*  for (var element in data.data!) {
                    appItemsList.addAll(element.appItemsList!);
                  }
*/
                  print("appItemsList size: ${appItemsList.length}");
                  print("PublishedSectionList size: ${getPublishedSectionResModelList.length}");
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
                  itemDataDCsList.addAll(data.data!.itemDataDCs as Iterable<ItemDataDCs>);

                  /*  for (var element in data.data!) {
                    appItemsList.addAll(element.appItemsList!);
                  }
*/
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
                  child: _myListView(context, getPublishedSectionResModelList),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future<void> GetPublishedSection(BuildContext context) async {
    Provider.of<DataProvider>(context, listen: false).GetPublishedSection(
      "RetailerApp", 202699, 1, "en", 0.0, 0.0,
    );

    Provider.of<DataProvider>(context, listen: false).GetGoldenDealItem(
      202699,  1, "en", 0, 4,
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
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        reverse: false,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: section.appItemsList!.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white ,
                              ),
                              child: Image.network(
                                item.bannerImage.toString(),
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 0.0,
                      right: 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(section.appItemsList!, (index, url) {
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index ? Colors.redAccent : Colors.green,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              )
            else if (section.sectionType == "Tile" && section.appItemsList != null)
              _myGridView(section.appItemsList!)
            else
              verticalListView(itemDataDCsList), // Handle other section types or empty state
          ],
        );
      },
    );
  }


  Widget _myGridView(List<AppItemsList> itemsList) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 5, // Spacing between columns
        mainAxisSpacing: 5, // Spacing between rows
      ),
      itemCount: itemsList.length, // Number of items based on data
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
                  ),
                ),

                Flexible(
                  child: Text(
                    item.tileName ?? 'Item $index', // Assuming there's a name field
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      padding: EdgeInsets.all(10),
      shrinkWrap: true, // Allows GridView to take only the required height
      physics: NeverScrollableScrollPhysics(), // Prevents GridView from scrolling inside ListView
    );
  }

/*  Widget horizontalListView() {
    return Container(
      height: 200, // Set a fixed height for the horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.vertical, // Scroll direction is horizontal
        itemCount: 20, // Number of items
        itemBuilder: (context, index) {
          return Container(
            width: 150, // Width of each item
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
  }*/

 /* Widget verticalListView(List<GoldenDealItemList> goldenDealItemList) {
    return Container(
     // Set a fixed height for the horizontal ListView
      child: ListView.builder(
        shrinkWrap: true, // Allows GridView to take only the required height
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical, // Scroll direction is horizontal
        itemCount: 20, // Number of items
        itemBuilder: (context, index) {
          return Container(
            width: 150, // Width of each item
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.greenAccent,
                child: Text(
                  'Item $index',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }*/
  Widget verticalListView(List<ItemDataDCs> itemDataDCs) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true, // Allows ListView to take only the required height
        physics: NeverScrollableScrollPhysics(), // Prevents the ListView from scrolling independently
        scrollDirection: Axis.vertical, // Vertical scroll direction
        itemCount: itemDataDCs.length, // Number of items
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
                                item.itemname.toString(), // Assuming there's a name field
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),

                            SvgPicture.asset(
                              'assets/icons/ic_Like_heart.svg',
                              semanticsLabel: 'home',
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(
                          textAlign: TextAlign.left,
                          "MRP : ${item.price.toString()}", // Assuming there's a name field
                          style: TextStyle(color: Colors.black, fontSize: 12,),
                        ),
                        SvgPicture.asset(
                          'assets/icons/ic_star.svg',
                          semanticsLabel: 'home',
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
