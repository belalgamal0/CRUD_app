import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomSheetWidget extends StatelessWidget {
  final TextEditingController productController;
  final TextEditingController priceController;
  final Function buttonAction;
  final BuildContext ctx;
  final String operationType;
  
  const BottomSheetWidget(
      {Key? key,
      required this.productController,
      required this.priceController,
      required this.buttonAction,
      required this.ctx,
      required this.operationType
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
              controller: productController,
              decoration: const InputDecoration(labelText: 'Name')),
          TextField(
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price')),
          const SizedBox(height: 20),
          ElevatedButton(
            child: Text(operationType),
            onPressed: () async {
              buttonAction();
            },
          )
        ],
      ),
    );
  }
}
