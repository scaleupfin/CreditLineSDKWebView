class OtpValidateModel {
  String? mobileNo;
  String? otp;


  OtpValidateModel({
    this.mobileNo,
    this.otp,
  });

  OtpValidateModel.fromJson(dynamic json) {
    mobileNo = json['MobileNo'];
    otp = json['OTP'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MobileNo'] = mobileNo;
    map['OTP'] = otp;
    return map;
  }
}