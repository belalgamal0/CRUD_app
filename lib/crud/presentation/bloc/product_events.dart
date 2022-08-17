import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddProductEvent extends ProductEvent {
  final String productName;
  final int productPrice;
  AddProductEvent({required this.productName, required this.productPrice});

  @override
  List<Object> get props => [productName, productPrice];
}
class UpdateProductEvent extends ProductEvent {
  final String productId;
  final String productName;
  final int productPrice;
  UpdateProductEvent({required this.productId, required this.productName, required this.productPrice});
  
  @override
  List<Object> get props => [productId, productName, productPrice];
}

class DeleteProductEvent extends ProductEvent {
  final String productId;
  DeleteProductEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

