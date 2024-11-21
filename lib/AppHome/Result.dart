import 'AppHomeDc.dart';
import 'ProductListDto.dart';

class Result {
  Result({
      this.appHomeDC, 
      this.productListDTO,});

  Result.fromJson(dynamic json) {
    if (json['appHomeDC'] != null) {
      appHomeDC = [];
      json['appHomeDC'].forEach((v) {
        appHomeDC?.add(AppHomeDc.fromJson(v));
      });
    }
    if (json['productListDTO'] != null) {
      productListDTO = [];
      json['productListDTO'].forEach((v) {
        productListDTO?.add(ProductListDto.fromJson(v));
      });
    }
  }
  List<AppHomeDc>? appHomeDC;
  List<ProductListDto>? productListDTO;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (appHomeDC != null) {
      map['appHomeDC'] = appHomeDC?.map((v) => v.toJson()).toList();
    }
    if (productListDTO != null) {
      map['productListDTO'] = productListDTO?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}