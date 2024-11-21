import 'Result.dart';

class AppHomeResponceModel {
  AppHomeResponceModel({
      this.result, 
      this.isSuccess, 
      this.message,});

  AppHomeResponceModel.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    isSuccess = json['isSuccess'];
    message = json['message'];
  }
  Result? result;
  bool? isSuccess;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['isSuccess'] = isSuccess;
    map['message'] = message;
    return map;
  }

}