class OtpResponceModel {
  OtpResponceModel({
      this.status, 
      this.message, 
      this.userId, 
      this.userTokan,});

  OtpResponceModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    userId = json['userId'];
    userTokan = json['userTokan'];
  }
  bool? status;
  String? message;
  String? userId;
  String? userTokan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['userId'] = userId;
    map['userTokan'] = userTokan;
    return map;
  }

}