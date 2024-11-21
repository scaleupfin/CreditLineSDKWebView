
import 'package:flutter/cupertino.dart';
import '../AppHome/GoldenDealItemResModel.dart';
import '../api/ApiService.dart';
import '../api/ExceptionHandling.dart';
import '../screen/create_account/model/ValidPanCardResponsModel.dart';


class PanProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  Result<ValidPanCardResponsModel,Exception>? _getLeadValidPanCardData;
  Result<ValidPanCardResponsModel,Exception>? get getLeadValidPanCardData => _getLeadValidPanCardData;



  Future<void> getLeadValidPanCard(String panNumber) async {
    _getLeadValidPanCardData = await apiService.getLeadValidPanCard(panNumber);
    notifyListeners();
  }

}

