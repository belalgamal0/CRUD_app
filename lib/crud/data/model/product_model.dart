
import '../../domain/entity/product.dart';

class ProductModel extends Product {
   ProductModel({
     int? id,
     required String product,
     required int price,
  }) : super(product: product,price: price);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      product: json['product'],
      price: (json['price'] as num).toInt(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product,
      'price':price
    };
  }
}