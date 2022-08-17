import 'package:equatable/equatable.dart';

class Product extends Equatable {
  
   int ? id;
  final String product;
  final int price;

   Product({
      this.id,
     required this.product,
     required this.price,
  });

  @override
  List<Object> get props => [product,price];
}