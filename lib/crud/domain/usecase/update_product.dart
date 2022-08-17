import 'package:dartz/dartz.dart';
import '../entity/product.dart';
import '../repository/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;
  UpdateProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call({required String productId, required String productName, required int productPrice}) async {
    return await repository.updateProduct(productId: productId, productName: productName, productPrice: productPrice);
  }
}