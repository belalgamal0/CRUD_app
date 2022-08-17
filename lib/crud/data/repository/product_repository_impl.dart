
import 'package:dartz/dartz.dart';
import '../datasource/product_remote_data_source.dart';
import '../../domain/entity/product.dart';
import '../../domain/repository/product_repository.dart';

class ProductRepositoryImple implements ProductRepository{
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImple({ required this.productRemoteDataSource});
  @override
  Future<Either<Failure, Product>> addProduct({required String productName, required int productPrice}) async{
      await productRemoteDataSource.createProduct(productName: productName,productPrice: productPrice);
      return Right(Product(product: productName, price: productPrice));
  }

  @override
  Future<Either<Failure, Product>> deleteProduct(String productId) async{
      await productRemoteDataSource.deleteProduct(productId);
      return Right(Product(product: '',price: 0));
  }

  @override
  Future<Either<Failure, Product>> updateProduct({required String productId, required String productName, required int productPrice}) async{
      await productRemoteDataSource.updateProduct(productId: productId, productName: productName, productPrice: productPrice);
      return Right(Product(product: productName, price: productPrice));
  }
}