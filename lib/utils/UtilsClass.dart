

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilsClass {

  static void showBottomToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  static onLoading(BuildContext context, String msg) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20.0, height: 60.0),
              // Add CircularProgressIndicator
              CircularProgressIndicator(),
              SizedBox(width: 20.0),
              // Replace CircularProgressIndicator with your custom image or keep both
              SizedBox(width: 20.0),
              Text(msg),
            ],
          ),
        ),
      ),
    );
  }

  static String getLastFour(String input) {
    if (input.length >= 4) {
      return input.substring(input.length - 4);
    } else {
      return input; // Return the original string if it's shorter than 4 characters
    }
  }


}