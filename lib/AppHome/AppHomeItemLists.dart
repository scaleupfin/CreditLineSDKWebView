import 'AppHomeItemContent.dart';

class AppHomeItemLists {
  AppHomeItemLists({
      this.appHomeItemId, 
      this.itemType, 
      this.itemName, 
      this.appHomeItemContent,});

  AppHomeItemLists.fromJson(dynamic json) {
    appHomeItemId = json['appHomeItemId'];
    itemType = json['itemType'];
    itemName = json['itemName'];
    if (json['appHomeItemContent'] != null) {
      appHomeItemContent = [];
      json['appHomeItemContent'].forEach((v) {
        appHomeItemContent?.add(AppHomeItemContent.fromJson(v));
      });
    }
  }
  int? appHomeItemId;
  String? itemType;
  String? itemName;
  List<AppHomeItemContent>? appHomeItemContent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appHomeItemId'] = appHomeItemId;
    map['itemType'] = itemType;
    map['itemName'] = itemName;
    if (appHomeItemContent != null) {
      map['appHomeItemContent'] = appHomeItemContent?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}