

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivity{
  Future<bool> networkConnectivity() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }
}