import 'AppHomeItemLists.dart';

class AppHomeDc {
  AppHomeDc({
      this.appHomeId, 
      this.appHomeHeading, 
      this.appHomeItemLists,});

  AppHomeDc.fromJson(dynamic json) {
    appHomeId = json['appHomeId'];
    appHomeHeading = json['appHomeHeading'];
    if (json['appHomeItemLists'] != null) {
      appHomeItemLists = [];
      json['appHomeItemLists'].forEach((v) {
        appHomeItemLists?.add(AppHomeItemLists.fromJson(v));
      });
    }
  }
  int? appHomeId;
  String? appHomeHeading;
  List<AppHomeItemLists>? appHomeItemLists;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appHomeId'] = appHomeId;
    map['appHomeHeading'] = appHomeHeading;
    if (appHomeItemLists != null) {
      map['appHomeItemLists'] = appHomeItemLists?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}