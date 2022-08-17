import 'package:dartz/dartz.dart';
import '../entity/product.dart';
import '../repository/product_repository.dart';

class DeleteProduct {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(String productId) async {
    return await repository.deleteProduct(productId);
  }
}