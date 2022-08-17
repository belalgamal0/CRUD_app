import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/usecase/update_product.dart';
import 'product_events.dart';
import 'product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/add_product.dart';
import '../../domain/usecase/delete_product.dart';
import '../view/widgets/bottom_sheet.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final TextEditingController productController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool productUpdated = false;
  bool priceUpdated = false;
  final DeleteProduct deleteProduct;
  final AddProduct addProduct;
  final UpdateProduct updateProduct;
  final CollectionReference productss = FirebaseFirestore.instance.collection('products');

  ProductBloc({
    required AddProduct add,
    required UpdateProduct update,
    required DeleteProduct del,
  })  : assert(add != null),
        assert(update != null),
        assert(del != null),
        addProduct = add,
        updateProduct = update,
        deleteProduct = del, super(Empty());

  @override
  ProductState get initialState => Empty();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is DeleteProductEvent) {
      yield Loading();
      await deleteProduct(event.productId);
      yield Loaded();
    } else if (event is AddProductEvent) {
      if (checkInputsForAdding()) {
        await addProduct(
            productName: productController.text,
            productPrice: int.parse(priceController.text));
      }
      productController.clear();
      priceController.clear();
    } else if (event is UpdateProductEvent) {
      yield Loading();
      await updateProduct(
          productId: event.productId,
          productName: productController.text,
          productPrice: int.parse(priceController.text));
      productController.clear();
      priceController.clear();
      yield Loaded();
    }
  }

  bool checkInputsForAdding() {
    if (productController.text != '' && priceController.text != '') {
      return true;
    } else {
      return false;
    }
  }

  ProductEvent checkOperationType(
      {required String operation, DocumentSnapshot? documentSnapshot}) {
    if (operation == 'Update') {
      return UpdateProductEvent(
          productId: documentSnapshot!.id,
          productName: productController.text,
          productPrice: int.parse(priceController.text));
    } else {
      return AddProductEvent(
          productName: productController.text,
          productPrice: int.parse(priceController.text));
    }
  }

  Future<void> updateProductMethod(
      {required BuildContext context,
      DocumentSnapshot? documentSnapshot,
      required String operation}) async {
    if (operation == 'Update') {
      productController.text = documentSnapshot!['product'];
      priceController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return BottomSheetWidget(
            productController: productController,
            priceController: priceController,
            operationType: operation,
            ctx: ctx,
            buttonAction: () {
              BlocProvider.of<ProductBloc>(context).add(checkOperationType(operation: operation, documentSnapshot: documentSnapshot));
              Navigator.of(context).pop();
            },
          );
        });
  }
}
