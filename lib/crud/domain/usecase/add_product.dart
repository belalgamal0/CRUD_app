import 'package:dartz/dartz.dart';
import '../entity/product.dart';
import '../repository/product_repository.dart';

class AddProduct {
  final ProductRepository repository;

  AddProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call({required String productName, required int productPrice}) async {
    return await repository.addProduct(productName: productName,productPrice: productPrice);
  }
}