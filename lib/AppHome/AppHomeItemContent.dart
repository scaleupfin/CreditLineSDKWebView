class AppHomeItemContent {
  AppHomeItemContent({
      this.appHomeItemContentId, 
      this.imageUrl, 
      this.sequence, 
      this.callBackUrl, 
      this.appHomeFnId,});

  AppHomeItemContent.fromJson(dynamic json) {
    appHomeItemContentId = json['appHomeItemContentId'];
    imageUrl = json['imageUrl'];
    sequence = json['sequence'];
    callBackUrl = json['callBackUrl'];
    appHomeFnId = json['appHomeFnId'];
  }
  int? appHomeItemContentId;
  String? imageUrl;
  int? sequence;
  String? callBackUrl;
  int? appHomeFnId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appHomeItemContentId'] = appHomeItemContentId;
    map['imageUrl'] = imageUrl;
    map['sequence'] = sequence;
    map['callBackUrl'] = callBackUrl;
    map['appHomeFnId'] = appHomeFnId;
    return map;
  }

}