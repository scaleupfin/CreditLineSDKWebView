import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:scale_up_module/view/aadhaar_screen/aadhaar_otp_screen.dart';
import 'package:scale_up_module/view/aadhaar_screen/models/AadhaaGenerateOTPRequestModel.dart';
import 'package:scale_up_module/view/aadhaar_screen/models/LeadAadhaarResponse.dart';
import '../../api/ApiService.dart';
import '../../api/FailureException.dart';
import '../../data_provider/DataProvider.dart';
import '../../shared_preferences/SharedPref.dart';
import '../../utils/ImagePicker.dart';
import '../../utils/Utils.dart';
import '../../utils/aadhaar_number_formatter.dart';
import '../../utils/common_elevted_button.dart';
import '../../utils/constants.dart';
import '../login_screen/login_screen.dart';
import 'components/CheckboxTerm.dart';
import 'models/AadhaarGenerateOTPResponseModel.dart';
import 'models/AadhaarGenerateOTPResponseModel.dart';
import 'models/AadhaarGenerateOTPResponseModel.dart';

class AadhaarScreen extends StatefulWidget {
  final int activityId;
  final int subActivityId;
  final String?  pageType;

  const AadhaarScreen(
      {super.key, required this.activityId, required this.subActivityId, this.pageType});

  @override
  State<AadhaarScreen> createState() => _AadhaarScreenState();
}

class _AadhaarScreenState extends State<AadhaarScreen> {
  final TextEditingController _aadhaarController = TextEditingController();
  DataProvider productProvider = DataProvider();
  String frontDocumentId = "";
  String backDocumentId = "";
  String frontFileUrl = "";
  String backFileUrl = "";
  var isFrontImageDelete = false;
  var isBackImageDelete = false;
  bool tcChecked = false;

  void _onFontImageSelected(File imageFile) async {
    Utils.onLoading(context, "");
    isFrontImageDelete = false;
    // Perform asynchronous work first
    await Provider.of<DataProvider>(context, listen: false).PostFrontAadhaarSingleFileData(imageFile, true, "", "");
    Navigator.of(context, rootNavigator: true).pop();
    // Update the widget state synchronously inside setState
  }

  // Callback function to receive the selected image
  void _onBackImageSelected(File imageFile) async {
    isBackImageDelete = false;
    Utils.onLoading(context, "");

    // Perform asynchronous work first
    await Provider.of<DataProvider>(context, listen: false)
        .postAadhaarBackSingleFile(imageFile, true, "", "");

    Navigator.of(context, rootNavigator: true).pop();
    // Update the widget state synchronously inside setState
  }

  void bottomSheetMenu(BuildContext context, String frontImage) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          // return const ImagePickerWidgets();
          return ImagePickerWidgets(
              onImageSelected: (frontImage == "AADHAAR_FRONT_IMAGE")
                  ? _onFontImageSelected
                  : _onBackImageSelected);
        });
  }

  @override
  Widget build(BuildContext context) {
    LeadAadhaarResponse? leadAadhaarResponse = null;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        debugPrint("didPop1: $didPop");
        if (didPop) {
          return;
        }
        if(widget.pageType == "pushReplacement" ) {
          final bool shouldPop = await Utils().onback(context);
          if (shouldPop) {
            SystemNavigator.pop();
          }
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
          body: SafeArea(
        top: true,
        bottom: true,
        child: Consumer<DataProvider>(builder: (context, productProvider, child) {
          if (productProvider.getLeadAadhaar != null) {
            productProvider.getLeadAadhaar!.when(
              success: (LeadAadhaarResponse) async {
                leadAadhaarResponse = LeadAadhaarResponse;
                if(leadAadhaarResponse != null) {
                  if (leadAadhaarResponse!.documentNumber != null) {
                    _aadhaarController.text = leadAadhaarResponse!.documentNumber!;
                  }

                  if (leadAadhaarResponse!.frontDocumentId != null) {
                    frontDocumentId =
                        leadAadhaarResponse!.frontDocumentId!.toString();
                  }

                  if (leadAadhaarResponse!.backDocumentId != null) {
                    backDocumentId =
                        leadAadhaarResponse!.backDocumentId!.toString();
                  }

                  if (leadAadhaarResponse!.frontImageUrl != null &&
                      !isFrontImageDelete) {
                    frontFileUrl = leadAadhaarResponse!.frontImageUrl!.toString();
                  }

                  if (leadAadhaarResponse!.backImageUrl != null &&
                      !isBackImageDelete) {
                    backFileUrl = leadAadhaarResponse!.backImageUrl!.toString();
                  }
                }
              },
              failure: (exception) {
                if (exception is ApiException) {
                  if(exception.statusCode==401){
                    productProvider.disposeAllProviderData();
                    ApiService().handle401(context);
                  }else{
                    Utils.showToast(exception.errorMessage,context);
                  }
                }
              },
            );

            if (productProvider.getPostFrontAadhaarSingleFileData != null &&
                !isFrontImageDelete) {
              if (productProvider.getPostFrontAadhaarSingleFileData!.filePath !=
                  null) {
                frontFileUrl =
                    productProvider.getPostFrontAadhaarSingleFileData!.filePath!;
                frontDocumentId = productProvider
                    .getPostFrontAadhaarSingleFileData!.docId!
                    .toString();
              }
            }
            if (productProvider.getPostBackAadhaarSingleFileData != null &&
                !isBackImageDelete) {
              if (productProvider.getPostBackAadhaarSingleFileData!.filePath !=
                  null) {
                backFileUrl =
                    productProvider.getPostBackAadhaarSingleFileData!.filePath!;
                backDocumentId = productProvider
                    .getPostBackAadhaarSingleFileData!.docId!
                    .toString();
              }
            }
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                    child: SizedBox(
                      height: 70,
                      width: 52,
                      child: Image.asset(
                        'assets/images/scale.png',
                        fit: BoxFit.fill,
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 50),
                  child: Text(
                    "Verify Aadhaar",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: blackSmall,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 44),
                  child: Text(
                    "Please validate your Aadhaar number",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: blackSmall,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      AadhaarNumberFormatter(),
                    ],
                    controller: _aadhaarController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: blackSmall,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      fillColor: textFiledBackgroundColour,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1),
                      ),
                      hintText: 'XXXX XXXX XXXX',
                      labelText: 'Aadhaar Card Number',
                      labelStyle: TextStyle(color: blackSmall),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [kPrimaryColor, kPrimaryColor],
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    height: 148,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: textFiledBackgroundColour,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: (frontFileUrl.isNotEmpty)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        frontFileUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 148,
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: SvgPicture.asset(
                                                "assets/icons/gallery.svg",
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        kPrimaryColor,
                                                        BlendMode.srcIn))),
                                        const Text(
                                          'Upload Aadhar Front Image',
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Text(
                                          'Supports : JPEG, PNG',
                                          style: TextStyle(
                                            color: blackSmall,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            onTap: () {
                              Utils.hideKeyBored(context);
                              bottomSheetMenu(context, "AADHAAR_FRONT_IMAGE");
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFrontImageDelete = true;
                              frontFileUrl = "";
                            });
                          },
                          child: !frontFileUrl.isEmpty
                              ? Container(
                                  padding: EdgeInsets.all(4),
                                  alignment: Alignment.topRight,
                                  child: SvgPicture.asset(
                                      'assets/icons/delete_icon.svg'),
                                )
                              : Container(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [kPrimaryColor, kPrimaryColor],
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        height: 148,
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: textFiledBackgroundColour,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: (backFileUrl.isNotEmpty)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        backFileUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 148,
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: SvgPicture.asset(
                                                "assets/icons/gallery.svg",
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        kPrimaryColor,
                                                        BlendMode.srcIn))),
                                        const Text(
                                          'Upload Aadhar Back Image',
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Text(
                                          'Supports : JPEG, PNG',
                                          style: TextStyle(
                                            color: blackSmall,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            onTap: () {
                              Utils.hideKeyBored(context);
                              bottomSheetMenu(context, "AADHAAR_BACK_IMAGE");
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isBackImageDelete = true;
                            backFileUrl = "";
                          });
                        },
                        child: !backFileUrl.isEmpty
                            ? Container(
                                padding: const EdgeInsets.all(4),
                                alignment: Alignment.topRight,
                                child: SvgPicture.asset(
                                    'assets/icons/delete_icon.svg'),
                              )
                            : Container(),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 30),
                  child:
                  CheckboxTerm(
                    content:
                        "I hereby agree to provide my Aadhaar Number and One Time Password (OTP) data for Aadhaar based authentication for KYC purpose in establishing my identity with Scaleupfincap Private Limited.",
                    onChanged: (bool? value) {
                      tcChecked = value!;
                    },
                  ),
                ),
                const SizedBox(height: 46),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: CommonElevatedButton(
                    onPressed: () {
                      //validate data
                      if (productProvider.getPostFrontAadhaarSingleFileData !=
                          null) {
                        if (productProvider
                                .getPostFrontAadhaarSingleFileData!.filePath !=
                            null) {
                          frontFileUrl = productProvider
                              .getPostFrontAadhaarSingleFileData!.filePath!;
                          frontDocumentId = productProvider
                              .getPostFrontAadhaarSingleFileData!.docId!
                              .toString();
                        }
                      }
                      if (productProvider.getPostBackAadhaarSingleFileData !=
                          null) {
                        if (productProvider
                                .getPostBackAadhaarSingleFileData!.filePath !=
                            null) {
                          backFileUrl = productProvider
                              .getPostBackAadhaarSingleFileData!.filePath!;
                          backDocumentId = productProvider
                              .getPostBackAadhaarSingleFileData!.docId!
                              .toString();
                        }
                      }

                      //call api
                      if (_aadhaarController.text.trim() == "") {
                        Utils.showToast("Please Enter Aadhaar Number",context);
                      } else if (frontFileUrl == "" || frontDocumentId == "") {
                        Utils.showToast("Please select Aadhaar Front Image",context);
                      } else if (backFileUrl == "" || backDocumentId == "") {
                        Utils.showToast("Please select Aadhaar Back Image",context);
                      } else if (!tcChecked) {
                        Utils.showToast("Please Check Terms and Conditions",context);
                      } else {
                        String stringWithSpaces = _aadhaarController.text;
                        print("normal" + stringWithSpaces);
                        String stringWithoutSpaces =
                        stringWithSpaces.replaceAll(RegExp(r'\s+'), '');
                        print("stringWithSpaces" + stringWithoutSpaces);
                        generateAadhaarOTPAPI(
                            context,
                            productProvider,
                            stringWithoutSpaces,
                            frontFileUrl,
                            frontDocumentId,
                            backFileUrl,
                            backDocumentId);
                      }
                    },
                    text: 'Proceed to E-Aadhaar',
                    upperCase: true,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      )),
    );
  }

  @override
  void initState() {
    super.initState();

    getAadhaarData(context);
  }

  @override
  void dispose() {
    _aadhaarController.dispose();
    super.dispose();
  }

  void generateAadhaarOTPAPI(
      BuildContext context,
      DataProvider productProvider,
      String documentNumber,
      String fFileUrl,
      String fDocumentId,
      String bFileUrl,
      String bDocumentId) async {

    var request = AadhaarGenerateOTPRequestModel(
        DocumentNumber: documentNumber,
        FrontFileUrl: fFileUrl,
        BackFileUrl: bFileUrl,
        FrontDocumentId: fDocumentId,
        BackDocumentId: bDocumentId,
        otp: "",
        requestId: "");

    Utils.onLoading(context, "");

    await Provider.of<DataProvider>(context, listen: false).leadAadharGenerateOTP(request);

    Navigator.of(context, rootNavigator: true).pop();

    if (productProvider.getLeadAadharGenerateOTP != null) {
      productProvider.getLeadAadharGenerateOTP!.when(
        success: (AadhaarGenerateOTPResponseModel) async {
          var leadAadhaarResponse = AadhaarGenerateOTPResponseModel;
          if(leadAadhaarResponse != null&&leadAadhaarResponse.data!=null) {
            String reqID = "";
            if (leadAadhaarResponse.data!.message != null) {
              print(leadAadhaarResponse.data!.message!);
            }
            reqID = leadAadhaarResponse.requestId!;
            productProvider.disposeAllSingleFileData();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AadhaarOtpScreen(
                        activityId: widget.activityId,
                        subActivityId: widget.subActivityId,
                        document: request,
                        requestId: reqID)));
          }else{
            Utils.showToast(leadAadhaarResponse.error!.error!.message!, context);
          }
        },
        failure: (exception) {
          if (exception is ApiException) {
            if(exception.statusCode==401){
              productProvider.disposeAllProviderData();
              ApiService().handle401(context);
            }else{
              Utils.showToast(exception.errorMessage,context);
            }
          }
        },
      );
    }
  }

  Future<void> getAadhaarData(BuildContext context) async {
    final prefsUtil = await SharedPref.getInstance();
    final String? userId = prefsUtil.getString(USER_ID);
    final String? productCode = prefsUtil.getString(PRODUCT_CODE);

    Provider.of<DataProvider>(context, listen: false).getLeadAadhar(userId!,productCode!);
  }
}
