import 'dart:convert';
import 'package:deynamic_update/utils/UtilsClass.dart';

import '../AppHome/AppHomeResponceModel.dart';
import '../AppHome/GoldenDealItemResModel.dart';
import '../screen/auth/model/OtpModel.dart';
import '../screen/auth/model/OtpResponceModel.dart';
import '../screen/auth/model/OtpValidateModel.dart';
import '../screen/create_account/model/ValidPanCardResponsModel.dart';
import '../shared_preferences/shared_pref.dart';
import '../utils/ConstentScreen.dart';
import '../utils/InternetConnectivity.dart';
import '../utils/constants/api_constants.dart';
import 'ApiUrls.dart';
import 'ExceptionHandling.dart';
import 'FailureException.dart';
import 'Interceptor.dart';

class ApiService {
  final interceptor = Interceptor();
  final internetConnectivity = InternetConnectivity();
  final apiUrls=ApiUrls();

  /* Future<void> handle401(BuildContext context) async {
    final prefsUtil = await SharedPref.getInstance();
    prefsUtil.saveBool(IS_LOGGED_IN, false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }*/

  Future<Result<OtpModel, Exception>> fetchOtpData(String mobileNumber) async {
    try {
      if (await internetConnectivity.networkConnectivity()) {
        final response = await interceptor.get(
        Uri.parse('${baseUrl+apiUrls.Genotp}?MobileNo=$mobileNumber'),
            //headers: {'Content-Type': 'application/json', 'noencryption': '1'},
    );

        switch (response.statusCode) {
          case 200:
          // Parse the JSON response

            final dynamic jsonData = json.decode(response.body);
            final OtpModel responseModel =
            OtpModel.fromJson(jsonData);

            return Success(responseModel);

          default:
            return Failure(ApiException(response.statusCode, ""));
        }
      } else {
        UtilsClass.showBottomToast("No Internet connection");
        return Failure(Exception("No Internet connection"));

      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  Future<Result<OtpResponceModel, Exception>> otpValidateData(OtpValidateModel model) async {
    try {
      if (await internetConnectivity.networkConnectivity()) {
        final response = await interceptor.post(
          Uri.parse('${baseUrl+apiUrls.otpValidate}'),
            headers: {
              "Accept": "application/json",
              "content-type":"application/json"
            },
            body: json.encode(model));
        print(response.body);
        switch (response.statusCode) {
          case 200:
            final dynamic jsonData = json.decode(response.body);
            final OtpResponceModel responseModel =
            OtpResponceModel.fromJson(jsonData);
            return Success(responseModel);
          default:
            return Failure(ApiException(response.statusCode, ""));
        }
      } else {
        UtilsClass.showBottomToast("No Internet connection");
        return Failure(Exception("No Internet connection"));

      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }


  Future<Result<AppHomeResponceModel, Exception>> getPublishedSection() async {
    try {
      if (await internetConnectivity.networkConnectivity()) {
        var token = await SharedPref.getStringFuture(TOKEN);
        final response = await interceptor.get(
          Uri.parse(
              '${baseUrl+apiUrls.GetAppHomeListForApp}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
            // Set the content type as JSON
          },
        );
        print(response.body);
        switch (response.statusCode) {
          case 200:
            // Parse the JSON response

            final dynamic jsonData = json.decode(response.body);
            final AppHomeResponceModel responseModel =
            AppHomeResponceModel.fromJson(jsonData);

            return Success(responseModel);

          default:
            return Failure(ApiException(response.statusCode, ""));
        }
      } else {
        return Failure(Exception("No Internet connection"));
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  Future<Result<GoldenDealItemResModel, Exception>> getGoldenDealItem(
      int customerId, int warehouseId, String lang, int skip, int take) async {
    try {
      if (await internetConnectivity.networkConnectivity()) {
        final response = await interceptor.get(
          Uri.parse(
              '${appHomeBaseUrl + getHomeGoldenDealItem}?customerId=$customerId&warehouseId=$warehouseId&lang=$lang&skip=$skip &take=$take'),
          headers: {'Content-Type': 'application/json', 'noencryption': '1'},
        );
        print(response.body); // Print the response body once here
        switch (response.statusCode) {
          case 200:
            // Parse the JSON response

            final dynamic jsonData = json.decode(response.body);
            final GoldenDealItemResModel responseModel =
                GoldenDealItemResModel.fromJson(jsonData);

            return Success(responseModel);

          default:
            return Failure(ApiException(response.statusCode, ""));
        }
      } else {
        return Failure(Exception("No Internet connection"));
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  //panCard Module
  Future<Result<ValidPanCardResponsModel, Exception>> getLeadValidPanCard(
      String panNumber) async {
    try {
      if (await internetConnectivity.networkConnectivity()) {
        var token = await SharedPref.getStringFuture(TOKEN);
        final response = await interceptor.get(
          Uri.parse(
              '${baseUrl+apiUrls.getLeadValidPanCard}?PanNumber=$panNumber'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
            // Set the content type as JSON
          },
        );

        print(response.body); // Print the response body once here
        switch (response.statusCode) {
        // Parse the JSON response
          case 200:
            final dynamic jsonData = json.decode(response.body);
            final ValidPanCardResponsModel responseModel =
            ValidPanCardResponsModel.fromJson(jsonData);
            return Success(responseModel);
          default:
          // 3. return Failure with the desired exception
            return Failure(ApiException(response.statusCode, ""));
        }
      } else {
        UtilsClass.showBottomToast("No Internet connection");
        return Failure(Exception("No Internet connection"));
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
