class ProductListDto {
  ProductListDto({
      this.productId, 
      this.productName, 
      this.productCode, 
      this.productType,});

  ProductListDto.fromJson(dynamic json) {
    productId = json['productId'];
    productName = json['productName'];
    productCode = json['productCode'];
    productType = json['productType'];
  }
  int? productId;
  String? productName;
  String? productCode;
  String? productType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = productId;
    map['productName'] = productName;
    map['productCode'] = productCode;
    map['productType'] = productType;
    return map;
  }

}