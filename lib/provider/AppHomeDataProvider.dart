
import 'package:flutter/cupertino.dart';

import '../AppHome/GetPublishedSectionResModel.dart';
import '../AppHome/GoldenDealItemResModel.dart';
import '../api/ApiService.dart';
import '../api/ExceptionHandling.dart';


class AppHomeDataProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();


  Result<GetPublishedSectionResModel,Exception>? _getPublishedSection;
  Result<GetPublishedSectionResModel,Exception>? get getPublishedSection =>_getPublishedSection;

  Result<GoldenDealItemResModel,Exception>? _getGoldenDealItemData;
  Result<GoldenDealItemResModel,Exception>? get getGoldenDealItemData =>_getGoldenDealItemData;




  Future<void> GetPublishedSection( String appType, int customerId,int wId,String lang,double lat,double lg) async {
    _getPublishedSection = await apiService.getPublishedSection(appType,customerId,wId,lang,lat,lg);
    notifyListeners();
  }

  Future<void> GetGoldenDealItem(int customerId,int warehouseId,String lang,int skip,int take) async {
    _getGoldenDealItemData = await apiService.getGoldenDealItem(customerId,warehouseId,lang,skip,take);
    notifyListeners();
  }
}

