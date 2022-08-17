import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductRemoteDataSource {
  Future<void> createProduct({required String productName,required int productPrice});
  Future<void> updateProduct({required String productId,required String productName,required int productPrice});
  Future<void> deleteProduct(String productId);
}
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{
    final CollectionReference _productsCollection = FirebaseFirestore.instance.collection('products');
    
      @override
      Future<void> createProduct({required String productName, required int productPrice}) async{
        await _productsCollection.add({'product': productName, 'price': productPrice});
      }
    
      @override
      Future<void> deleteProduct(String productId) async{
        await _productsCollection.doc(productId).delete();
      }
    
      @override
      Future<void> updateProduct({required String productId, required String productName,required int productPrice}) async{
        await _productsCollection.doc(productId).update({'product': productName, 'price': productPrice});
      }
}