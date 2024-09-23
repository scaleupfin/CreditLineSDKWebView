import 'package:flutter/material.dart';

class CreateAccountProvider with ChangeNotifier {
  bool _isAuthorized = false;
  bool _sendReminders = false;
  bool _isButtonEnabled = false;
  bool _isLoading = false;

  bool get isAuthorized => _isAuthorized;
  bool get sendReminders => _sendReminders;
  bool get isButtonEnabled => _isButtonEnabled;
  bool get isLoading => _isLoading;


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
}