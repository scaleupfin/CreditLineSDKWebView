
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:scale_up_module/view/aadhaar_screen/models/ValidateAadhaarOTPRequestModel.dart';
import 'package:scale_up_module/view/aadhaar_screen/models/ValidateAadhaarOTPResponseModel.dart';
import 'package:scale_up_module/view/pancard_screen/model/PostLeadPANRequestModel.dart';
import 'package:scale_up_module/view/pancard_screen/model/PostSingleFileResponseModel.dart';
import 'package:scale_up_module/view/personal_info/model/PostPersonalDetailsResponseModel.dart';
import 'package:scale_up_module/ProductCompanyDetailResponseModel.dart';

import '../api/ApiService.dart';
import '../api/ExceptionHandling.dart';
import '../view/aadhaar_screen/models/AadhaaGenerateOTPRequestModel.dart';
import '../view/aadhaar_screen/models/AadhaarGenerateOTPResponseModel.dart';
import '../view/aadhaar_screen/models/LeadAadhaarResponse.dart';
import '../view/agreement_screen/model/CheckSignResponceModel.dart';
import '../view/bank_details_screen/model/BankDetailsResponceModel.dart';
import '../view/bank_details_screen/model/BankListResponceModel.dart';
import '../view/bank_details_screen/model/SaveBankDetailResponce.dart';
import '../view/bank_details_screen/model/SaveBankDetailsRequestModel.dart';
import '../view/bank_details_screen/model/TransactionDetailModel.dart';
import '../view/business_details_screen/model/CustomerDetailUsingGSTResponseModel.dart';
import '../view/business_details_screen/model/LeadBusinessDetailResponseModel.dart';
import '../view/business_details_screen/model/PostLeadBuisnessDetailRequestModel.dart';
import '../view/business_details_screen/model/PostLeadBuisnessDetailResponsModel.dart';
import '../view/checkoutView/model/CheckOutOtpModel.dart';
import '../view/checkoutView/model/OrderPaymentModel.dart';
import '../view/checkoutView/model/PayemtOrderPostRequestModel.dart';
import '../view/checkoutView/model/ValidOtpForCheckoutModel.dart';
import '../view/checkoutView/model/ValidOtpForCheckoutResModel.dart';
import '../view/checkoutView/model/ValidateOrderOtpReqModel.dart';
import '../view/checkoutView/model/ValidateOrderOtpResModel.dart';
import '../view/dashboard_screen/model/CustomerTransactionListRequestModel.dart';
import '../view/dashboard_screen/my_account/model/CustomerOrderSummaryResModel.dart';
import '../view/dashboard_screen/my_account/model/CustomerTransactionListRespModel.dart';
import '../view/dashboard_screen/transactions_screen/model/CustomerTransactionListTwoReqModel.dart';
import '../view/dashboard_screen/transactions_screen/model/CustomerTransactionListTwoRespModel.dart';
import '../view/dashboard_screen/vendorDetail/model/TransactionBreakupResModel.dart';
import '../view/login_screen/model/GenrateOptResponceModel.dart';
import '../view/otp_screens/model/VarifayOtpRequest.dart';
import '../view/otp_screens/model/VerifyOtpResponce.dart';
import '../view/pancard_screen/model/FathersNameByValidPanCardResponseModel.dart';
import '../view/pancard_screen/model/LeadPanResponseModel.dart';
import '../view/pancard_screen/model/PostLeadPANResponseModel.dart';
import '../view/pancard_screen/model/ValidPanCardResponsModel.dart';
import '../view/personal_info/model/AllStateResponce.dart';
import '../view/personal_info/model/CityResponce.dart';
import '../view/personal_info/model/ElectricityAuthenticationReqModel.dart';
import '../view/personal_info/model/ElectricityAuthenticationResModel.dart';
import '../view/personal_info/model/ElectricityServiceProviderListResModel.dart';
import '../view/personal_info/model/ElectricityStateResModel.dart';
import '../view/personal_info/model/EmailExistRespoce.dart';
import '../view/personal_info/model/IvrsResModel.dart';
import '../view/personal_info/model/OTPValidateForEmailRequest.dart';
import '../view/personal_info/model/PersonalDetailsRequestModel.dart';
import '../view/personal_info/model/PersonalDetailsResponce.dart';
import '../view/personal_info/model/SendOtpOnEmailResponce.dart';
import '../view/personal_info/model/ValidEmResponce.dart';
import '../view/profile_screen/model/AcceptedResponceModel.dart';
import '../view/profile_screen/model/DisbursementCompletedResponse.dart';
import '../view/profile_screen/model/DisbursementResponce.dart';
import '../view/profile_screen/model/InProgressScreenModel.dart';
import '../view/profile_screen/model/OfferPersonNameResponceModel.dart';
import '../view/profile_screen/model/OfferResponceModel.dart';
import '../view/splash_screen/model/GetLeadResponseModel.dart';
import '../view/splash_screen/model/LeadCurrentRequestModel.dart';
import '../view/splash_screen/model/LeadCurrentResponseModel.dart';
import '../view/take_selfi/model/LeadSelfieResponseModel.dart';
import '../view/take_selfi/model/PostLeadSelfieRequestModel.dart';
import '../view/take_selfi/model/PostLeadSelfieResponseModel.dart';

class DataProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();


  GetLeadResponseModel? _getLeadData;

  GetLeadResponseModel? get getLeadData => _getLeadData;

  LeadCurrentResponseModel? _leadCurrentActivityAsyncData;

  LeadCurrentResponseModel? get leadCurrentActivityAsyncData =>
      _leadCurrentActivityAsyncData;

 /* ProductCompanyDetailResponseModel? _ProductCompanyDetailResponseModel;

  ProductCompanyDetailResponseModel? get productCompanyDetailResponseModel => _ProductCompanyDetailResponseModel;
*/
  ProductCompanyDetailResponseModel? _ProductCompanyDetailResponseModel;

  ProductCompanyDetailResponseModel? get productCompanyDetailResponseModel =>
      _ProductCompanyDetailResponseModel;

  Result< GenrateOptResponceModel, Exception>? _genrateOptData;
  Result< GenrateOptResponceModel, Exception>? get genrateOptData => _genrateOptData;

  //pan card module
  Result< LeadPanResponseModel, Exception>? _getLeadPANData;
  Result< LeadPanResponseModel, Exception>? get getLeadPANData => _getLeadPANData;

  Result<ValidPanCardResponsModel,Exception>? _getLeadValidPanCardData;
  Result<ValidPanCardResponsModel,Exception>? get getLeadValidPanCardData =>
      _getLeadValidPanCardData;

  Result<FathersNameByValidPanCardResponseModel,Exception>? _getFathersNameByValidPanCardData;
  Result<FathersNameByValidPanCardResponseModel,Exception>? get getFathersNameByValidPanCardData => _getFathersNameByValidPanCardData;

  PostSingleFileResponseModel? _getPostSingleFileData;
  PostSingleFileResponseModel? get getPostSingleFileData => _getPostSingleFileData;

  Result<PostLeadPanResponseModel,Exception>? _getPostLeadPanData;
  Result<PostLeadPanResponseModel,Exception>? get getPostLeadPaneData => _getPostLeadPanData;

  //Aadhaar module
  Result<LeadAadhaarResponse,Exception>? _getLeadAadhaar;
  Result<LeadAadhaarResponse,Exception>? get getLeadAadhaar =>
      _getLeadAadhaar;

  Result<AadhaarGenerateOTPResponseModel,Exception>? _getLeadAadharGenerateOTP;
  Result<AadhaarGenerateOTPResponseModel,Exception>? get getLeadAadharGenerateOTP => _getLeadAadharGenerateOTP;

  Result<ValidateAadhaarOTPResponseModel,Exception>? _getValidateAadhaarOTPData;
  Result<ValidateAadhaarOTPResponseModel,Exception>? get getValidateAadhaarOTPData => _getValidateAadhaarOTPData;

  PostSingleFileResponseModel? _getPostBackAadhaarSingleFileData;
  PostSingleFileResponseModel? get getPostBackAadhaarSingleFileData => _getPostBackAadhaarSingleFileData;

  PostSingleFileResponseModel? _getPostFrontAadhaarSingleFileData;
  PostSingleFileResponseModel? get getPostFrontAadhaarSingleFileData => _getPostFrontAadhaarSingleFileData;

  //take selfie module
  Result<LeadSelfieResponseModel,Exception>? _getLeadSelfieData;
  Result<LeadSelfieResponseModel,Exception>? get getLeadSelfieData =>
      _getLeadSelfieData;

  Result<PostLeadSelfieResponseModel,Exception>? _getPostLeadSelfieData;
  Result<PostLeadSelfieResponseModel,Exception>? get getPostLeadSelfieData => _getPostLeadSelfieData;

  PostSingleFileResponseModel? _getPostSelfieImageSingleFileData;
  PostSingleFileResponseModel? get getPostSelfieImageSingleFileData => _getPostSelfieImageSingleFileData;

  //Personal Info Module
  Result<PersonalDetailsResponce,Exception>? _getPersonalDetailsData;
  Result<PersonalDetailsResponce,Exception>? get getPersonalDetailsData =>
      _getPersonalDetailsData;

  PostSingleFileResponseModel? _getpostElectricityBillDocumentSingleFileData;
  PostSingleFileResponseModel? get getpostElectricityBillDocumentSingleFileData => _getpostElectricityBillDocumentSingleFileData;

  //Buisness details
  PostSingleFileResponseModel? _getpostBusineesDoumentSingleFileData;
  PostSingleFileResponseModel? get getpostBusineesDoumentSingleFileData => _getpostBusineesDoumentSingleFileData;

  Result<DisbursementResponce,Exception>? _getDisbursementProposalData;
  Result<DisbursementResponce,Exception>? get getDisbursementProposalData => _getDisbursementProposalData;

  Result<DisbursementCompletedResponse,Exception>? _getDisbursementData;
  Result<DisbursementCompletedResponse,Exception>? get getDisbursementData => _getDisbursementData;


  Result<VerifyOtpResponce,Exception>? _getVerifyData;
  Result<VerifyOtpResponce,Exception>? get getVerifyData => _getVerifyData;

  BankListResponceModel? _getBankListData;

  BankListResponceModel? get getBankListData => _getBankListData;

  Result<BankDetailsResponceModel,Exception>? _getBankDetailsData;
  Result<BankDetailsResponceModel,Exception>? get getBankDetailsData => _getBankDetailsData;

  AllStateResponce? _getAllStateData;

  AllStateResponce? get getAllStateData => _getAllStateData;

  List<CityResponce?>? _getAllCityData;
  List<CityResponce?>? get getAllCityData => _getAllCityData;

  List<CityResponce?>? _getCurrentAllCityData;
  List<CityResponce?>? get getCurrentAllCityData => _getCurrentAllCityData;

  EmailExistRespoce? _getEmailExistData;

  EmailExistRespoce? get getEmailExistData => _getEmailExistData;

  SendOtpOnEmailResponce? _getOtpOnEmailData;

  SendOtpOnEmailResponce? get getOtpOnEmailData => _getOtpOnEmailData;

  ValidEmResponce? _getValidOtpEmailData;

  ValidEmResponce? get getValidOtpEmailData => _getValidOtpEmailData;

  PostPersonalDetailsResponseModel? _getPostPersonalDetailsResponseModel;

  PostPersonalDetailsResponseModel? get getPostPersonalDetailsResponseModel =>
      _getPostPersonalDetailsResponseModel;

  LeadBusinessDetailResponseModel? _getLeadBusinessDetailData;
  LeadBusinessDetailResponseModel? get getLeadBusinessDetailData => _getLeadBusinessDetailData;

  CustomerDetailUsingGstResponseModel? _getCustomerDetailUsingGSTData;
  CustomerDetailUsingGstResponseModel? get getCustomerDetailUsingGSTData => _getCustomerDetailUsingGSTData;

  Result<PostLeadBuisnessDetailResponsModel,Exception>? _getPostLeadBuisnessDetailData;
  Result<PostLeadBuisnessDetailResponsModel,Exception>? get getPostLeadBuisnessDetailData => _getPostLeadBuisnessDetailData;


  Result<OfferResponceModel,Exception>? _getOfferResponceata;
  Result<OfferResponceModel,Exception>? get getOfferResponceata => _getOfferResponceata;

  Result<AcceptedResponceModel,Exception>? _getAcceptOfferData;
  Result<AcceptedResponceModel,Exception>? get getAcceptOfferData => _getAcceptOfferData;

  Result<OfferPersonNameResponceModel,Exception>? _getLeadNameData;
  Result<OfferPersonNameResponceModel,Exception>? get getLeadNameData => _getLeadNameData;

  Result<SaveBankDetailResponce,Exception>? _getSaveLeadBankDetailData;
  Result<SaveBankDetailResponce,Exception>? get getSaveLeadBankDetailData => _getSaveLeadBankDetailData;


  Result< CheckOutOtpModel, Exception>? _genrateOptPaymentData;
  Result< CheckOutOtpModel, Exception>? get genrateOptPaymentData => _genrateOptPaymentData;

  Result< bool, Exception>? _reSendOptPaymentData;
  Result< bool, Exception>? get reSendOptPaymentData => _reSendOptPaymentData;

  Result< ValidOtpForCheckoutResModel, Exception>? _validOptPaymentData;
  Result< ValidOtpForCheckoutResModel, Exception>? get validOptPaymentData => _validOptPaymentData;

  Result< ValidateOrderOtpResModel, Exception>? _validateOrderOtpData;
  Result< ValidateOrderOtpResModel, Exception>? get validateOrderOtpData => _validateOrderOtpData;

  Result< TransactionDetailModel, Exception>? _getTranscationData;
  Result< TransactionDetailModel, Exception>? get getTranscationData => _getTranscationData;

  Result< OrderPaymentModel, Exception>? _postPaymentOrderData;
  Result< OrderPaymentModel, Exception>? get postPaymentOrderData => _postPaymentOrderData;

  Result<CustomerOrderSummaryResModel,Exception>? _getCustomerOrderSummaryData;
  Result<CustomerOrderSummaryResModel,Exception>? get getCustomerOrderSummaryData => _getCustomerOrderSummaryData;

  Result<List<CustomerTransactionListRespModel>,Exception>? _getCustomerTransactionListData;
  Result<List<CustomerTransactionListRespModel>,Exception>? get getCustomerTransactionListData => _getCustomerTransactionListData;

  Result<OfferResponceModel,Exception>? _getCustomerOrderSummaryForAnchorData;
  Result<OfferResponceModel,Exception>? get getCustomerOrderSummaryForAnchorData => _getCustomerOrderSummaryForAnchorData;

  Result<List<CustomerTransactionListTwoRespModel>,Exception>? _getCustomerTransactionListTwoData;
  Result<List<CustomerTransactionListTwoRespModel>,Exception>? get getCustomerTransactionListTwoData => _getCustomerTransactionListTwoData;

  Result<TransactionBreakupResModel,Exception>? _getTransactionBreakupData;
  Result<TransactionBreakupResModel,Exception>? get getTransactionBreakupData => _getTransactionBreakupData;

  Result<CheckSignResponceModel,Exception>? _getCheckSignData;
  Result<CheckSignResponceModel,Exception>? get getCheckSignData => _getCheckSignData;

  Result<AcceptedResponceModel,Exception>? _getNextCallData;
  Result<AcceptedResponceModel,Exception>? get getNextCallData => _getNextCallData;

  /*Result<IvrsNumberExistResModel,Exception>? _getIvrsNumberExistData;
  Result<IvrsNumberExistResModel,Exception>? get getIvrsNumberExistData => _getIvrsNumberExistData;*/

  Result<IvrsResModel,Exception>? _getIvrsData;
  Result<IvrsResModel,Exception>? get getIvrsData => _getIvrsData;

  Result<List<ElectricityServiceProviderListResModel>,Exception>? _getElectricityServiceProviderListData;
  Result<List<ElectricityServiceProviderListResModel>,Exception>? get getElectricityServiceProviderData => _getElectricityServiceProviderListData;

  Result<List<ElectricityStateResModel>,Exception>? _getElectricityStateListData;
  Result<List<ElectricityStateResModel>,Exception>? get getElectricityStateListData => _getElectricityStateListData;

  Result<ElectricityAuthenticationResModel,Exception>? _getElectricityAuthenticationData;
  Result<ElectricityAuthenticationResModel,Exception>? get getElectricityAuthenticationData => _getElectricityAuthenticationData;

  Result<InProgressScreenModel,Exception>? _InProgressScreen;
  Result<InProgressScreenModel,Exception>? get InProgressScreenData => _InProgressScreen;

  Result< bool, Exception>? _lesentOrderLoginOTPData;
  Result< bool, Exception>? get lesentOrderLoginOTPData => _lesentOrderLoginOTPData;



  Future<void> productCompanyDetail(
      String product, String company) async {
    _ProductCompanyDetailResponseModel =
        await apiService.productCompanyDetail(product, company);
    notifyListeners();
  }

  Future<void> getLeads(
      String mobile, int productId, int companyId, int leadId) async {
    _getLeadData =
    await apiService.getLeads(mobile, productId, companyId, leadId);
    notifyListeners();
  }

  Future<void> getLeadPAN(String userId,String productCode) async {
    _getLeadPANData = await apiService.getLeadPAN(userId,productCode);
    notifyListeners();
  }

  Future<void> genrateOtp(BuildContext context, String mobileNumber, int CompanyID, ) async {
    _genrateOptData = await apiService.genrateOtp(context, mobileNumber, CompanyID);
    notifyListeners();
  }

  Future<void> getLeadValidPanCard(String panNumber) async {
    _getLeadValidPanCardData = await apiService.getLeadValidPanCard(panNumber);
    notifyListeners();
  }

  Future<void> leadCurrentActivityAsync(
      LeadCurrentRequestModel leadCurrentRequestModel) async {
    _leadCurrentActivityAsyncData =
        await apiService.leadCurrentActivityAsync(leadCurrentRequestModel);
    notifyListeners();
  }

  Future<void> verifyOtp(VarifayOtpRequest verifayOtp) async {
    _getVerifyData = await apiService.verifyOtp(verifayOtp);
    notifyListeners();
  }

  Future<void> getLeadAadhar(String userId,String productCode) async {
    _getLeadAadhaar = await apiService.getLeadAadhar(userId,productCode);
    notifyListeners();
  }

  Future<void> leadAadharGenerateOTP(
      AadhaarGenerateOTPRequestModel aadhaarGenerateOTPRequestModel) async {
    _getLeadAadharGenerateOTP =
    await apiService.getLeadAadharGenerateOTP(aadhaarGenerateOTPRequestModel);
    notifyListeners();
  }

  Future<void> getFathersNameByValidPanCard(String panNumber) async {
    _getFathersNameByValidPanCardData =
        await apiService.getFathersNameByValidPanCard(panNumber);
    notifyListeners();
  }

  Future<void> postSingleFile(File imageFile, bool isValidForLifeTime,
      String validityInDays, String subFolderName) async {
    _getPostSingleFileData = await apiService.postSingleFile(
        imageFile, isValidForLifeTime, validityInDays, subFolderName);
    notifyListeners();
  }

  Future<void> postTakeSelfieFile(File imageFile, bool isValidForLifeTime,
      String validityInDays, String subFolderName) async {
    _getPostSelfieImageSingleFileData = await apiService.postSingleFile(
        imageFile, isValidForLifeTime, validityInDays, subFolderName);
    notifyListeners();
  }

  Future<void> postElectricityBillDocumentSingleFile(File imageFile, bool isValidForLifeTime,
      String validityInDays, String subFolderName) async {
    _getpostElectricityBillDocumentSingleFileData = await apiService.postSingleFile(
        imageFile, isValidForLifeTime, validityInDays, subFolderName);
    notifyListeners();
  }

  Future<void> PostFrontAadhaarSingleFileData(File imageFile, bool isValidForLifeTime,
      String validityInDays, String subFolderName) async {
    _getPostFrontAadhaarSingleFileData = await apiService.postSingleFile(
        imageFile, isValidForLifeTime, validityInDays, subFolderName);
    notifyListeners();
  }

  Future<void> disposeAllSingleFileData() async {
    _getPostFrontAadhaarSingleFileData = null;
    _getPostBackAadhaarSingleFileData=null;
    _getPostSingleFileData=null;
    _getpostElectricityBillDocumentSingleFileData = null;
    _getPostSelfieImageSingleFileData = null;
    notifyListeners();
  }

  Future<void> postBusineesDoumentSingleFile(File imageFile, bool isValidForLifeTime,
      String validityInDays, String subFolderName) async {
    _getpostBusineesDoumentSingleFileData = await apiService.postSingleFile(
        imageFile, isValidForLifeTime, validityInDays, subFolderName);
    notifyListeners();
  }

  Future<void> postLeadPAN(
      PostLeadPanRequestModel postLeadPanRequestModel) async {
    _getPostLeadPanData = await apiService.postLeadPAN(postLeadPanRequestModel);
    notifyListeners();
  }


  Future<void> getBankList(BuildContext context) async {
    _getBankListData = await apiService.getBankList(context);
    notifyListeners();
  }

  Future<void> getBankDetails(int leadID,String productCode) async {
    _getBankDetailsData = await apiService.GetLeadBankDetail(leadID,productCode);
    notifyListeners();
  }


  Future<void> getLeadPersonalDetails(String userId,String productCode) async {
    _getPersonalDetailsData = await apiService.getLeadPersnalDetails(userId,productCode);
    notifyListeners();
  }

  Future<void> getAllState(BuildContext context) async {
    _getAllStateData = await apiService.getAllState(context);
    notifyListeners();
  }

  Future<void> getAllCity(int stateID, BuildContext context) async {
    _getAllCityData = await apiService.GetCityByStateId(stateID,context);
    notifyListeners();
  }

  Future<void> getCurrentAllCity(int stateID, BuildContext context) async {
    _getCurrentAllCityData = await apiService.GetCityByStateId(stateID,context);
    notifyListeners();
  }

  Future<void> postAadhaarBackSingleFile(File imageFile, bool isValidForLifeTime,
      String validityInDays, String subFolderName) async {
    _getPostBackAadhaarSingleFileData = await apiService.postSingleFile(
        imageFile, isValidForLifeTime, validityInDays, subFolderName);
    notifyListeners();
  }

  Future<void> validateAadhaarOtp(ValidateAadhaarOTPRequestModel verifayOtp) async {
    _getValidateAadhaarOTPData = await apiService.validateAadhaarOtp(verifayOtp);
    notifyListeners();
  }

  Future<void> isEmailExist(String UserID,String Emailid) async {
    _getEmailExistData = await apiService.emailExist(UserID,Emailid);
    notifyListeners();
  }

  Future<void> getSendOtpOnEmail(String Emailid) async {
    _getOtpOnEmailData = await apiService.sendOtpOnEmail(Emailid);
    notifyListeners();
  }

  Future<void> otpValidateForEmail(OtpValidateForEmailRequest model, BuildContext context) async {
    _getValidOtpEmailData = await apiService.otpValidateForEmail(model,context);
    notifyListeners();
  }

  Future<void> getLeadSelfie(String userId,String productCode) async {
    _getLeadSelfieData = await apiService.getLeadSelfie(userId,productCode);
    notifyListeners();
  }

  Future<void> postLeadSelfie(
      PostLeadSelfieRequestModel postLeadSelfieRequestModel) async {
    _getPostLeadSelfieData =
    await apiService.postLeadSelfie(postLeadSelfieRequestModel);

  }

  Future<void> postLeadPersonalDetail(
      PersonalDetailsRequestModel personalDetailsRequestModel, BuildContext context) async {
    _getPostPersonalDetailsResponseModel =
    await apiService.postLeadPersonalDetail(personalDetailsRequestModel, context);

  }

  Future<void> getLeadBusinessDetail(String userId,String productCode, BuildContext context) async {
    _getLeadBusinessDetailData = await apiService.getLeadBusinessDetail(userId,productCode, context);
    notifyListeners();
  }

  Future<void> getCustomerDetailUsingGST(String GSTNumber, BuildContext context) async {
    _getCustomerDetailUsingGSTData = await apiService.getCustomerDetailUsingGST(GSTNumber, context);
    notifyListeners();
  }

  Future<void> postLeadBuisnessDetail(PostLeadBuisnessDetailRequestModel postLeadBuisnessDetailRequestModel) async {
    _getPostLeadBuisnessDetailData = await apiService.postLeadBuisnessDetail(postLeadBuisnessDetailRequestModel);
    notifyListeners();
  }

  Future<void> GetLeadOffer(int leadId ,int companyID) async {
    _getOfferResponceata = await apiService.GetLeadOffer(leadId,companyID);
    notifyListeners();
  }
  Future<void> getAcceptOffer(int leadId) async {
    _getAcceptOfferData = await apiService.getAcceptOffer(leadId);
    notifyListeners();
  }

  Future<void> getLeadName(String UserId,String productcode) async {
    _getLeadNameData = await apiService.getLeadName(UserId,productcode);
    notifyListeners();
  }
  Future<void> saveLeadBankDetail(SaveBankDetailsRequestModel model) async {
    _getSaveLeadBankDetailData = await apiService.saveLeadBankDetail(model);
    notifyListeners();
  }

  Future<void> getDisbursementProposal(int leadId) async {
    _getDisbursementProposalData = await apiService.GetDisbursementProposal(leadId);
    notifyListeners();
  }

  Future<void> GetDisbursement(int leadId) async {
    _getDisbursementData = await apiService.GetDisbursement(leadId);
    notifyListeners();
  }
 Future<void> GetByTransactionReqNoForOTP(String transactionReqNo) async {
   _genrateOptPaymentData = await apiService.genrateOtpPaymentConfromation(transactionReqNo);
    notifyListeners();
  }

  Future<void> reSendOtpPaymentConfromation(String MobileNo,String transactionReqNo) async {
    _reSendOptPaymentData = await apiService.reSendOtpPaymentConfromation(MobileNo,transactionReqNo);
    notifyListeners();
  }

  Future<void> ValidateOrderOTPGetToken(String MobileNo,String otp,String transactionReqNo) async {
    _validOptPaymentData = await apiService.ValidateOrderOTPGetToken(MobileNo,otp,transactionReqNo);
    notifyListeners();
  }

  Future<void> GetByTransactionReqNo(String transactionReqNo) async {
    _getTranscationData = await apiService.GetByTransactionReqNo(transactionReqNo);
    notifyListeners();
  }
  Future<void> PostOrderPlacement(PayemtOrderPostRequestModel model) async {
    _postPaymentOrderData = await apiService.PostOrderPlacement(model);
    notifyListeners();
  }

  Future<void> getCustomerOrderSummary( leadId) async {
    _getCustomerOrderSummaryData = await apiService.getCustomerOrderSummary(leadId);
    notifyListeners();
  }

  Future<void> getCustomerTransactionList(
      CustomerTransactionListRequestModel customerTransactionListRequestModel) async {
    _getCustomerTransactionListData =
    await apiService.getCustomerTransactionList(customerTransactionListRequestModel);
    notifyListeners();
  }

  Future<void> getCustomerOrderSummaryForAnchor(int leadId) async {
    _getCustomerOrderSummaryForAnchorData = await apiService.getCustomerOrderSummaryForAnchor(leadId);
    notifyListeners();
  }

  Future<void> getCustomerTransactionListTwo(
      CustomerTransactionListTwoReqModel customerTransactionListTwoReqModel) async {
    _getCustomerTransactionListTwoData =
    await apiService.getCustomerTransactionListTwo(customerTransactionListTwoReqModel);
    notifyListeners();
  }

  Future<void> disposegetCustomerOrderSummaryData() async {
    _getCustomerOrderSummaryData = null;
    _getCustomerTransactionListTwoData = null;
    notifyListeners();
  }

  Future<void> disposegetCustomerTransactionList() async {
    _getCustomerTransactionListData = null;
    notifyListeners();
  }

  Future<void> getTransactionBreakup(int invoiceId) async {
    _getTransactionBreakupData = await apiService.getTransactionBreakup(invoiceId);
    notifyListeners();
  }

  Future<void> checkEsignStatus(int leadID) async {
    _getCheckSignData = await apiService.checkEsignStatus(leadID);
    notifyListeners();
  }

  Future<void> getCallNext(int leadId) async {
    _getNextCallData = await apiService.getNextCall(leadId);
    notifyListeners();
  }


  Future<void> leadDataOnInProgressScreen(int leadId) async {
    _InProgressScreen = await apiService.leadDataOnInProgressScreen(leadId);
    notifyListeners();
  }

  Future<void> getIvrsNumberExist(String UserId,String IvrsNumber) async {
    _getIvrsData = await apiService.getIvrsNumberExist(UserId,IvrsNumber);
    notifyListeners();
  }

  Future<void> getKarzaElectricityServiceProviderList() async {
    _getElectricityServiceProviderListData =
    await apiService.getKarzaElectricityServiceProviderList();
    notifyListeners();
  }

  Future<void> getKarzaElectricityState(String state) async {
    _getElectricityStateListData =
    (await apiService.getKarzaElectricityState(state)) ;
    notifyListeners();
  }

  Future<void> getKarzaElectricityAuthentication(ElectricityAuthenticationReqModel electricityAuthenticationReqModel) async {
    _getElectricityAuthenticationData = await apiService.getKarzaElectricityAuthentication(electricityAuthenticationReqModel) ;
    notifyListeners();
  }

  Future<void> resentOrderLoginOTP(String transactionReqNo) async {
    _lesentOrderLoginOTPData = await apiService.resentOrderLoginOTP(transactionReqNo);
    notifyListeners();
  }

  Future<void> ValidateOrderOtp( ValidateOrderOtpReqModel validateOrderOtpResModel) async {
    _validateOrderOtpData = await apiService.ValidateOrderOtp(validateOrderOtpResModel);
    notifyListeners();
  }



  Future<void> disposeAllProviderData() async {
    _getCustomerOrderSummaryData = null;
    _getCustomerTransactionListTwoData = null;
    _ProductCompanyDetailResponseModel = null;
    _genrateOptData = null;
    _getLeadPANData = null;
    _getLeadValidPanCardData = null;
    _getFathersNameByValidPanCardData = null;
    _getPostLeadPanData = null;
    _getLeadAadhaar = null;
    _getValidateAadhaarOTPData = null;
    _getLeadAadharGenerateOTP = null;
    _getLeadSelfieData = null;
    _getPostLeadSelfieData = null;
    _getPersonalDetailsData = null;
    _getDisbursementProposalData = null;
    _getDisbursementData = null;
    _getVerifyData = null;
    _getBankListData = null;
    _getBankDetailsData = null;
    _getAllStateData = null;
    _getAllCityData = null;
    _getCurrentAllCityData = null;
    _getEmailExistData = null;
    _getOtpOnEmailData = null;
    _getValidOtpEmailData = null;
    _getPostPersonalDetailsResponseModel = null;
    _getLeadBusinessDetailData = null;
    _getCustomerDetailUsingGSTData = null;
    _getPostLeadBuisnessDetailData = null;
    _getOfferResponceata = null;
    _getAcceptOfferData = null;
    _getLeadNameData = null;
    _getSaveLeadBankDetailData = null;
    _genrateOptPaymentData = null;
    _reSendOptPaymentData = null;
    _getTranscationData = null;
    _validOptPaymentData = null;
    _postPaymentOrderData = null;
    _getCustomerOrderSummaryData = null;
    _getCustomerTransactionListData = null;
    _getCustomerOrderSummaryForAnchorData = null;
    _getCustomerTransactionListTwoData = null;
    _getTransactionBreakupData = null;
    _getCheckSignData = null;
    _getNextCallData = null;
    _getIvrsData = null;
    _getElectricityServiceProviderListData = null;
    _getElectricityStateListData = null;
    _getElectricityAuthenticationData = null;
    _InProgressScreen = null;
    notifyListeners();
  }

}

