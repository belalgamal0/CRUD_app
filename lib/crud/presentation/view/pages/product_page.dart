import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_events.dart';
import '../../bloc/product_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key ?key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BlocProvider<ProductBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<ProductBloc>(),
        child: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return StreamBuilder(
              stream: BlocProvider.of<ProductBloc>(context).productss.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                      return Card(
                        margin: const EdgeInsets.all(20),
                        child: ListTile(
                          title: Row(
                            children: [const Text('Product: '),
                              Text(documentSnapshot['product']),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              const Text('Price: '),
                              Text(documentSnapshot['price'].toString()),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () =>
                                        BlocProvider.of<ProductBloc>(context).updateProductMethod(
                                                context: context,
                                                documentSnapshot: documentSnapshot,
                                                operation: "Update")),
                                IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => BlocProvider.of<ProductBloc>(context).add(DeleteProductEvent(documentSnapshot.id)))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD Application')),
      body: Container(child: buildBody(context)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<ProductBloc>(context).updateProductMethod(context: context, operation: "Create"),
        child: const Icon(Icons.add),
      ),
    );
  }
}
