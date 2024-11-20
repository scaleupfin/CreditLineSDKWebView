import 'package:deynamic_update/screen/auth/model/OtpValidateModel.dart';
import 'package:flutter/material.dart';

import '../api/ApiService.dart';
import '../api/ExceptionHandling.dart';
import '../screen/auth/model/OtpModel.dart';
import '../screen/auth/model/OtpResponceModel.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthorized = false;
  bool _sendReminders = false;
  bool _isButtonEnabled = false;
  bool _isLoading = false;
  final ApiService apiService = ApiService();

  bool get isAuthorized => _isAuthorized;
  bool get sendReminders => _sendReminders;
  bool get isButtonEnabled => _isButtonEnabled;
  bool get isLoading => _isLoading;


  Result<OtpModel, Exception>? _getFetchOtp;

  Result<OtpModel, Exception>? get getFetchOtpData => _getFetchOtp;

  Result<OtpResponceModel, Exception>? _getOtpValidate;

  Result<OtpResponceModel, Exception>? get getOtpValidateData => _getOtpValidate;


  Future<void> fetchOtpData(String mobileNumber) async {
    _getFetchOtp = await apiService.fetchOtpData(mobileNumber);
    notifyListeners();
  }

  Future<void> otpValidateData(OtpValidateModel model) async {
    _getOtpValidate = await apiService.otpValidateData(model);
    notifyListeners();
  }

  void setAuthorized(bool isAuth) {
    _isAuthorized = isAuth;
    _updateButtonEnabled();
    notifyListeners();
  }

  void setSendReminders(bool sendReminder) {
    _sendReminders = sendReminder;
    _updateButtonEnabled();
    notifyListeners();
  }

  void _updateButtonEnabled() {
    _isButtonEnabled = _isAuthorized && _sendReminders;
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> disposeAllAuth() async {
    _getFetchOtp = null;
  }
}