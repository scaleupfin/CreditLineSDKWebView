class GetPublishedSectionResModel {
  String? status;
  String? errorMessage;
  List<Data>? data;
  String? timestamp;

  GetPublishedSectionResModel(
      {this.status, this.errorMessage, this.data, this.timestamp});

  GetPublishedSectionResModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    errorMessage = json['ErrorMessage'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    timestamp = json['Timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['ErrorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Timestamp'] = this.timestamp;
    return data;
  }
}

class Data {
  int? sectionID;
  String? sectionName;
  bool? isTile;
  String? sectionType;
  bool? isBanner;
  bool? isPopUp;
  int? sequence;
  int? rowCount;
  int? columnCount;
  bool? hasBackgroundColor;
  String? tileBackgroundColor;
  bool? deleted;
  bool? active;
  Null? bannerBackgroundColor;
  Null? tileHeaderBackgroundColor;
  Null? tileBackgroundImage;
  bool? hasHeaderBackgroundImage;
  String? tileHeaderBackgroundImage;
  bool? isSingleBackgroundImage;
  Null? tileAreaHeaderBackgroundImage;
  Null? headerTextColor;
  int? headerTextSize;
  String? sectionBackgroundImage;
  bool? isTileSlider;
  String? sectionHindiName;
  String? viewType;
  String? webViewUrl;
  String? sectionSubType;
  List<AppItemsList>? appItemsList;

  Data(
      {this.sectionID,
        this.sectionName,
        this.isTile,
        this.sectionType,
        this.isBanner,
        this.isPopUp,
        this.sequence,
        this.rowCount,
        this.columnCount,
        this.hasBackgroundColor,
        this.tileBackgroundColor,
        this.deleted,
        this.active,
        this.bannerBackgroundColor,
        this.tileHeaderBackgroundColor,
        this.tileBackgroundImage,
        this.hasHeaderBackgroundImage,
        this.tileHeaderBackgroundImage,
        this.isSingleBackgroundImage,
        this.tileAreaHeaderBackgroundImage,
        this.headerTextColor,
        this.headerTextSize,
        this.sectionBackgroundImage,
        this.isTileSlider,
        this.sectionHindiName,
        this.viewType,
        this.webViewUrl,
        this.sectionSubType,
        this.appItemsList});

  Data.fromJson(Map<String, dynamic> json) {
    sectionID = json['SectionID'];
    sectionName = json['SectionName'];
    isTile = json['IsTile'];
    sectionType = json['SectionType'];
    isBanner = json['IsBanner'];
    isPopUp = json['IsPopUp'];
    sequence = json['Sequence'];
    rowCount = json['RowCount'];
    columnCount = json['ColumnCount'];
    hasBackgroundColor = json['HasBackgroundColor'];
    tileBackgroundColor = json['TileBackgroundColor'];
    deleted = json['Deleted'];
    active = json['Active'];
    bannerBackgroundColor = json['BannerBackgroundColor'];
    tileHeaderBackgroundColor = json['TileHeaderBackgroundColor'];
    tileBackgroundImage = json['TileBackgroundImage'];
    hasHeaderBackgroundImage = json['HasHeaderBackgroundImage'];
    tileHeaderBackgroundImage = json['TileHeaderBackgroundImage'];
    isSingleBackgroundImage = json['IsSingleBackgroundImage'];
    tileAreaHeaderBackgroundImage = json['TileAreaHeaderBackgroundImage'];
    headerTextColor = json['HeaderTextColor'];
    headerTextSize = json['HeaderTextSize'];
    sectionBackgroundImage = json['sectionBackgroundImage'];
    isTileSlider = json['IsTileSlider'];
    sectionHindiName = json['SectionHindiName'];
    viewType = json['ViewType'];
    webViewUrl = json['WebViewUrl'];
    sectionSubType = json['SectionSubType'];
    if (json['AppItemsList'] != null) {
      appItemsList = <AppItemsList>[];
      json['AppItemsList'].forEach((v) {
        appItemsList!.add(new AppItemsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SectionID'] = this.sectionID;
    data['SectionName'] = this.sectionName;
    data['IsTile'] = this.isTile;
    data['SectionType'] = this.sectionType;
    data['IsBanner'] = this.isBanner;
    data['IsPopUp'] = this.isPopUp;
    data['Sequence'] = this.sequence;
    data['RowCount'] = this.rowCount;
    data['ColumnCount'] = this.columnCount;
    data['HasBackgroundColor'] = this.hasBackgroundColor;
    data['TileBackgroundColor'] = this.tileBackgroundColor;
    data['Deleted'] = this.deleted;
    data['Active'] = this.active;
    data['BannerBackgroundColor'] = this.bannerBackgroundColor;
    data['TileHeaderBackgroundColor'] = this.tileHeaderBackgroundColor;
    data['TileBackgroundImage'] = this.tileBackgroundImage;
    data['HasHeaderBackgroundImage'] = this.hasHeaderBackgroundImage;
    data['TileHeaderBackgroundImage'] = this.tileHeaderBackgroundImage;
    data['IsSingleBackgroundImage'] = this.isSingleBackgroundImage;
    data['TileAreaHeaderBackgroundImage'] = this.tileAreaHeaderBackgroundImage;
    data['HeaderTextColor'] = this.headerTextColor;
    data['HeaderTextSize'] = this.headerTextSize;
    data['sectionBackgroundImage'] = this.sectionBackgroundImage;
    data['IsTileSlider'] = this.isTileSlider;
    data['SectionHindiName'] = this.sectionHindiName;
    data['ViewType'] = this.viewType;
    data['WebViewUrl'] = this.webViewUrl;
    data['SectionSubType'] = this.sectionSubType;
    if (this.appItemsList != null) {
      data['AppItemsList'] = this.appItemsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppItemsList {
  String? tileName;
  String? tileImage;
  String? bannerImage;
  String? redirectionType;
  Null? redirectionUrl;
  int? redirectionID;
  int? baseCategoryId;
  int? categoryId;
  int? subCategoryId;
  int? subsubCategoryId;
  String? tileSectionBackgroundImage;
  String? offerStartTime;
  String? offerEndTime;
  bool? expired;
  bool? deleted;
  String? bannerActivity;

  AppItemsList(
      {this.tileName,
        this.tileImage,
        this.bannerImage,
        this.redirectionType,
        this.redirectionUrl,
        this.redirectionID,
        this.baseCategoryId,
        this.categoryId,
        this.subCategoryId,
        this.subsubCategoryId,
        this.tileSectionBackgroundImage,
        this.offerStartTime,
        this.offerEndTime,
        this.expired,
        this.deleted,
        this.bannerActivity});

  AppItemsList.fromJson(Map<String, dynamic> json) {
    tileName = json['TileName'];
    tileImage = json['TileImage'];
    bannerImage = json['BannerImage'];
    redirectionType = json['RedirectionType'];
    redirectionUrl = json['RedirectionUrl'];
    redirectionID = json['RedirectionID'];
    baseCategoryId = json['BaseCategoryId'];
    categoryId = json['CategoryId'];
    subCategoryId = json['SubCategoryId'];
    subsubCategoryId = json['SubsubCategoryId'];
    tileSectionBackgroundImage = json['TileSectionBackgroundImage'];
    offerStartTime = json['OfferStartTime'];
    offerEndTime = json['OfferEndTime'];
    expired = json['Expired'];
    deleted = json['Deleted'];
    bannerActivity = json['BannerActivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TileName'] = this.tileName;
    data['TileImage'] = this.tileImage;
    data['BannerImage'] = this.bannerImage;
    data['RedirectionType'] = this.redirectionType;
    data['RedirectionUrl'] = this.redirectionUrl;
    data['RedirectionID'] = this.redirectionID;
    data['BaseCategoryId'] = this.baseCategoryId;
    data['CategoryId'] = this.categoryId;
    data['SubCategoryId'] = this.subCategoryId;
    data['SubsubCategoryId'] = this.subsubCategoryId;
    data['TileSectionBackgroundImage'] = this.tileSectionBackgroundImage;
    data['OfferStartTime'] = this.offerStartTime;
    data['OfferEndTime'] = this.offerEndTime;
    data['Expired'] = this.expired;
    data['Deleted'] = this.deleted;
    data['BannerActivity'] = this.bannerActivity;
    return data;
  }
}
