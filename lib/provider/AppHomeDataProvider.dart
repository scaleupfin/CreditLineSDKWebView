
import 'package:flutter/cupertino.dart';
import '../AppHome/AppHomeResponceModel.dart';
import '../AppHome/GoldenDealItemResModel.dart';
import '../api/ApiService.dart';
import '../api/ExceptionHandling.dart';


class AppHomeDataProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  var isLoading = true;


  Result<AppHomeResponceModel,Exception>? _getPublishedSection;
  Result<AppHomeResponceModel,Exception>? get getPublishedSection =>_getPublishedSection;

  Result<GoldenDealItemResModel,Exception>? _getGoldenDealItemData;
  Result<GoldenDealItemResModel,Exception>? get getGoldenDealItemData =>_getGoldenDealItemData;




  Future<void> GetPublishedSection() async {
    isLoading=true;
    _getPublishedSection = await apiService.getPublishedSection();
    isLoading=false;
    notifyListeners();
  }

  Future<void> GetGoldenDealItem(int customerId,int warehouseId,String lang,int skip,int take) async {
    _getGoldenDealItemData = await apiService.getGoldenDealItem(customerId,warehouseId,lang,skip,take);
    notifyListeners();
  }

  Future<void> disposeHomePage() async {
    isLoading = true;
    notifyListeners();
  }
}

