class GoldenDealItemResModel {
  String? status;
  String? errorMessage;
  GoldenDealItemList? data;
  String? timestamp;

  GoldenDealItemResModel(
      {this.status, this.errorMessage, this.data, this.timestamp});

  GoldenDealItemResModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    errorMessage = json['ErrorMessage'];
    data = json['Data'] != null ? new GoldenDealItemList.fromJson(json['Data']) : null;
    timestamp = json['Timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['ErrorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Timestamp'] = this.timestamp;
    return data;
  }
}

class GoldenDealItemList {
  int? totalItem;
  List<ItemDataDCs>? itemDataDCs;

  GoldenDealItemList({this.totalItem, this.itemDataDCs});

  GoldenDealItemList.fromJson(Map<String, dynamic> json) {
    totalItem = json['TotalItem'];
    if (json['ItemDataDCs'] != null) {
      itemDataDCs = <ItemDataDCs>[];
      json['ItemDataDCs'].forEach((v) {
        itemDataDCs!.add(new ItemDataDCs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalItem'] = this.totalItem;
    if (this.itemDataDCs != null) {
      data['ItemDataDCs'] = this.itemDataDCs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemDataDCs {
  bool? active;
  int? itemId;
  int? baseCategoryId;
  int? categoryid;
  int? subCategoryId;
  int? subsubCategoryid;
  int? itemlimitQty;
  bool? isItemLimit;
  String? itemNumber;
  int? companyId;
  int? warehouseId;
  double? discount;
  Null? sellingSku;
  Null? sellingUnitName;
  double? vATTax;
  String? itemname;
  double? price;
  double? unitPrice;
  String? logoUrl;
  int? minOrderQty;
  double? totalTaxPercentage;
  double? marginPoint;
  Null? promoPerItems;
  int? dreamPoint;
  bool? isOffer;
  String? unitofQuantity;
  String? uOM;
  String? itemBaseName;
  bool? deleted;
  bool? isFlashDealUsed;
  int? itemMultiMRPId;
  double? netPurchasePrice;
  int? billLimitQty;
  bool? isSensitive;
  bool? isSensitiveMRP;
  String? hindiName;
  int? offerCategory;
  String? offerStartTime;
  String? offerEndTime;
  double? offerQtyAvaiable;
  double? offerQtyConsumed;
  int? offerId;
  String? offerType;
  double? offerWalletPoint;
  int? offerFreeItemId;
  Null? freeItemId;
  double? offerPercentage;
  String? offerFreeItemName;
  String? offerFreeItemImage;
  int? offerFreeItemQuantity;
  int? offerMinimumQty;
  double? flashDealSpecialPrice;
  Null? flashDealMaxQtyPersonCanTake;
  Null? distributionPrice;
  bool? distributorShow;
  int? itemAppType;
  Null? mRP;
  bool? isPrimeItem;
  double? primePrice;
  String? noPrimeOfferStartTime;
  String? currentStartTime;
  bool? isFlashDealStart;
  String? scheme;
  Null? number;
  int? itemtype;
  double? rating;
  int? sequence;
  Null? lastOrderDate;
  Null? lastOrderQty;
  Null? lastOrderDays;
  Null? totalAmt;
  Null? purchaseValue;
  Null? classification;
  Null? backgroundRgbColor;
  double? tradePrice;
  double? wholeSalePrice;

  ItemDataDCs(
      {this.active,
        this.itemId,
        this.baseCategoryId,
        this.categoryid,
        this.subCategoryId,
        this.subsubCategoryid,
        this.itemlimitQty,
        this.isItemLimit,
        this.itemNumber,
        this.companyId,
        this.warehouseId,
        this.discount,
        this.sellingSku,
        this.sellingUnitName,
        this.vATTax,
        this.itemname,
        this.price,
        this.unitPrice,
        this.logoUrl,
        this.minOrderQty,
        this.totalTaxPercentage,
        this.marginPoint,
        this.promoPerItems,
        this.dreamPoint,
        this.isOffer,
        this.unitofQuantity,
        this.uOM,
        this.itemBaseName,
        this.deleted,
        this.isFlashDealUsed,
        this.itemMultiMRPId,
        this.netPurchasePrice,
        this.billLimitQty,
        this.isSensitive,
        this.isSensitiveMRP,
        this.hindiName,
        this.offerCategory,
        this.offerStartTime,
        this.offerEndTime,
        this.offerQtyAvaiable,
        this.offerQtyConsumed,
        this.offerId,
        this.offerType,
        this.offerWalletPoint,
        this.offerFreeItemId,
        this.freeItemId,
        this.offerPercentage,
        this.offerFreeItemName,
        this.offerFreeItemImage,
        this.offerFreeItemQuantity,
        this.offerMinimumQty,
        this.flashDealSpecialPrice,
        this.flashDealMaxQtyPersonCanTake,
        this.distributionPrice,
        this.distributorShow,
        this.itemAppType,
        this.mRP,
        this.isPrimeItem,
        this.primePrice,
        this.noPrimeOfferStartTime,
        this.currentStartTime,
        this.isFlashDealStart,
        this.scheme,
        this.number,
        this.itemtype,
        this.rating,
        this.sequence,
        this.lastOrderDate,
        this.lastOrderQty,
        this.lastOrderDays,
        this.totalAmt,
        this.purchaseValue,
        this.classification,
        this.backgroundRgbColor,
        this.tradePrice,
        this.wholeSalePrice});

  ItemDataDCs.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    itemId = json['ItemId'];
    baseCategoryId = json['BaseCategoryId'];
    categoryid = json['Categoryid'];
    subCategoryId = json['SubCategoryId'];
    subsubCategoryid = json['SubsubCategoryid'];
    itemlimitQty = json['ItemlimitQty'];
    isItemLimit = json['IsItemLimit'];
    itemNumber = json['ItemNumber'];
    companyId = json['CompanyId'];
    warehouseId = json['WarehouseId'];
    discount = json['Discount'];
    sellingSku = json['SellingSku'];
    sellingUnitName = json['SellingUnitName'];
    vATTax = json['VATTax'];
    itemname = json['itemname'];
    price = json['price'];
    unitPrice = json['UnitPrice'];
    logoUrl = json['LogoUrl'];
    minOrderQty = json['MinOrderQty'];
    totalTaxPercentage = json['TotalTaxPercentage'];
    marginPoint = json['marginPoint'];
    promoPerItems = json['promoPerItems'];
    dreamPoint = json['dreamPoint'];
    isOffer = json['IsOffer'];
    unitofQuantity = json['UnitofQuantity'];
    uOM = json['UOM'];
    itemBaseName = json['itemBaseName'];
    deleted = json['Deleted'];
    isFlashDealUsed = json['IsFlashDealUsed'];
    itemMultiMRPId = json['ItemMultiMRPId'];
    netPurchasePrice = json['NetPurchasePrice'];
    billLimitQty = json['BillLimitQty'];
    isSensitive = json['IsSensitive'];
    isSensitiveMRP = json['IsSensitiveMRP'];
    hindiName = json['HindiName'];
    offerCategory = json['OfferCategory'];
    offerStartTime = json['OfferStartTime'];
    offerEndTime = json['OfferEndTime'];
    offerQtyAvaiable = json['OfferQtyAvaiable'];
    offerQtyConsumed = json['OfferQtyConsumed'];
    offerId = json['OfferId'];
    offerType = json['OfferType'];
    offerWalletPoint = json['OfferWalletPoint'];
    offerFreeItemId = json['OfferFreeItemId'];
    freeItemId = json['FreeItemId'];
    offerPercentage = json['OfferPercentage'];
    offerFreeItemName = json['OfferFreeItemName'];
    offerFreeItemImage = json['OfferFreeItemImage'];
    offerFreeItemQuantity = json['OfferFreeItemQuantity'];
    offerMinimumQty = json['OfferMinimumQty'];
    flashDealSpecialPrice = json['FlashDealSpecialPrice'];
    flashDealMaxQtyPersonCanTake = json['FlashDealMaxQtyPersonCanTake'];
    distributionPrice = json['DistributionPrice'];
    distributorShow = json['DistributorShow'];
    itemAppType = json['ItemAppType'];
    mRP = json['MRP'];
    isPrimeItem = json['IsPrimeItem'];
    primePrice = json['PrimePrice'];
    noPrimeOfferStartTime = json['NoPrimeOfferStartTime'];
    currentStartTime = json['CurrentStartTime'];
    isFlashDealStart = json['IsFlashDealStart'];
    scheme = json['Scheme'];
    number = json['Number'];
    itemtype = json['Itemtype'];
    rating = json['Rating'];
    sequence = json['Sequence'];
    lastOrderDate = json['LastOrderDate'];
    lastOrderQty = json['LastOrderQty'];
    lastOrderDays = json['LastOrderDays'];
    totalAmt = json['TotalAmt'];
    purchaseValue = json['PurchaseValue'];
    classification = json['Classification'];
    backgroundRgbColor = json['BackgroundRgbColor'];
    tradePrice = json['TradePrice'];
    wholeSalePrice = json['WholeSalePrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['ItemId'] = this.itemId;
    data['BaseCategoryId'] = this.baseCategoryId;
    data['Categoryid'] = this.categoryid;
    data['SubCategoryId'] = this.subCategoryId;
    data['SubsubCategoryid'] = this.subsubCategoryid;
    data['ItemlimitQty'] = this.itemlimitQty;
    data['IsItemLimit'] = this.isItemLimit;
    data['ItemNumber'] = this.itemNumber;
    data['CompanyId'] = this.companyId;
    data['WarehouseId'] = this.warehouseId;
    data['Discount'] = this.discount;
    data['SellingSku'] = this.sellingSku;
    data['SellingUnitName'] = this.sellingUnitName;
    data['VATTax'] = this.vATTax;
    data['itemname'] = this.itemname;
    data['price'] = this.price;
    data['UnitPrice'] = this.unitPrice;
    data['LogoUrl'] = this.logoUrl;
    data['MinOrderQty'] = this.minOrderQty;
    data['TotalTaxPercentage'] = this.totalTaxPercentage;
    data['marginPoint'] = this.marginPoint;
    data['promoPerItems'] = this.promoPerItems;
    data['dreamPoint'] = this.dreamPoint;
    data['IsOffer'] = this.isOffer;
    data['UnitofQuantity'] = this.unitofQuantity;
    data['UOM'] = this.uOM;
    data['itemBaseName'] = this.itemBaseName;
    data['Deleted'] = this.deleted;
    data['IsFlashDealUsed'] = this.isFlashDealUsed;
    data['ItemMultiMRPId'] = this.itemMultiMRPId;
    data['NetPurchasePrice'] = this.netPurchasePrice;
    data['BillLimitQty'] = this.billLimitQty;
    data['IsSensitive'] = this.isSensitive;
    data['IsSensitiveMRP'] = this.isSensitiveMRP;
    data['HindiName'] = this.hindiName;
    data['OfferCategory'] = this.offerCategory;
    data['OfferStartTime'] = this.offerStartTime;
    data['OfferEndTime'] = this.offerEndTime;
    data['OfferQtyAvaiable'] = this.offerQtyAvaiable;
    data['OfferQtyConsumed'] = this.offerQtyConsumed;
    data['OfferId'] = this.offerId;
    data['OfferType'] = this.offerType;
    data['OfferWalletPoint'] = this.offerWalletPoint;
    data['OfferFreeItemId'] = this.offerFreeItemId;
    data['FreeItemId'] = this.freeItemId;
    data['OfferPercentage'] = this.offerPercentage;
    data['OfferFreeItemName'] = this.offerFreeItemName;
    data['OfferFreeItemImage'] = this.offerFreeItemImage;
    data['OfferFreeItemQuantity'] = this.offerFreeItemQuantity;
    data['OfferMinimumQty'] = this.offerMinimumQty;
    data['FlashDealSpecialPrice'] = this.flashDealSpecialPrice;
    data['FlashDealMaxQtyPersonCanTake'] = this.flashDealMaxQtyPersonCanTake;
    data['DistributionPrice'] = this.distributionPrice;
    data['DistributorShow'] = this.distributorShow;
    data['ItemAppType'] = this.itemAppType;
    data['MRP'] = this.mRP;
    data['IsPrimeItem'] = this.isPrimeItem;
    data['PrimePrice'] = this.primePrice;
    data['NoPrimeOfferStartTime'] = this.noPrimeOfferStartTime;
    data['CurrentStartTime'] = this.currentStartTime;
    data['IsFlashDealStart'] = this.isFlashDealStart;
    data['Scheme'] = this.scheme;
    data['Number'] = this.number;
    data['Itemtype'] = this.itemtype;
    data['Rating'] = this.rating;
    data['Sequence'] = this.sequence;
    data['LastOrderDate'] = this.lastOrderDate;
    data['LastOrderQty'] = this.lastOrderQty;
    data['LastOrderDays'] = this.lastOrderDays;
    data['TotalAmt'] = this.totalAmt;
    data['PurchaseValue'] = this.purchaseValue;
    data['Classification'] = this.classification;
    data['BackgroundRgbColor'] = this.backgroundRgbColor;
    data['TradePrice'] = this.tradePrice;
    data['WholeSalePrice'] = this.wholeSalePrice;
    return data;
  }
}
