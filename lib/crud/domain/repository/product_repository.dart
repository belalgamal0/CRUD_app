import 'package:dartz/dartz.dart';
import '../entity/product.dart';

abstract class ProductRepository{
  Future<Either<Failure,Product>> addProduct({required String productName,required int productPrice});
  Future<Either<Failure,Product>> updateProduct({required String productId,required String productName,required int productPrice});
  Future<Either<Failure,Product>> deleteProduct(String productId);

}
abstract class Failure {}
class ServerFailure extends Failure{}