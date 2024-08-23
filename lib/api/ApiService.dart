
import 'dart:convert';
import 'package:deynamic_update/api/utils/InternetConnectivity.dart';
import '../AppHome/GetPublishedSectionResModel.dart';
import '../AppHome/GoldenDealItemResModel.dart';
import 'ApiUrls.dart';
import 'ExceptionHandling.dart';
import 'FailureException.dart';
import 'Interceptor.dart';

class ApiService {
  final apiUrls = ApiUrls();
  final interceptor = Interceptor();
  final internetConnectivity = InternetConnectivity();

 /* Future<void> handle401(BuildContext context) async {
    final prefsUtil = await SharedPref.getInstance();
    prefsUtil.saveBool(IS_LOGGED_IN, false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }*/

  Future<Result<GetPublishedSectionResModel, Exception>> getPublishedSection(
      String appType, int customerId,int wId,String lang,double lat,double lg) async {
    try {
      if (await internetConnectivity.networkConnectivity()) {
        final response = await interceptor.get(
          Uri.parse(
              '${ApiUrls().AppHomeBaseUrl  + apiUrls.getPublishedSection}?appType=$appType&customerId=$customerId&wId=$wId&lang=$lang&lat=$lat&lg=$lg'),
          headers: {
            'Content-Type': 'application/json',
            'noencryption': '1'
          },
        );
        print(response.body); // Print the response body once here
        switch (response.statusCode) {
          case 200:
          // Parse the JSON response

            final dynamic jsonData = json.decode(response.body);
            final GetPublishedSectionResModel responseModel =
            GetPublishedSectionResModel.fromJson(jsonData);

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
      int customerId,int warehouseId,String lang,int skip,int take) async {
    try {
      if (await internetConnectivity.networkConnectivity()) {
        final response = await interceptor.get(
          Uri.parse(
              '${ApiUrls().AppHomeBaseUrl  + apiUrls.getGoldenDealItem}?customerId=$customerId&warehouseId=$warehouseId&lang=$lang&skip=$skip &take=$take'),
          headers: {
            'Content-Type': 'application/json',
            'noencryption': '1'
          },
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
}
