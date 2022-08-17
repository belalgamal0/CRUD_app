import 'crud/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'crud/presentation/view/pages/product_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCFRTYZIHm5i-enXdjjJwFIcjs-M1l7CgE",
          authDomain: "crud-abc1e.firebaseapp.com",
          projectId: "crud-abc1e",
          storageBucket: "crud-abc1e.appspot.com",
          messagingSenderId: "988180462557",
          appId: "1:988180462557:web:a763c57285ad1a3309d434",
          measurementId: "G-N0M9L87XCD"));
  await di.init();
  runApp(const CRUDApp());
}

class CRUDApp extends StatelessWidget {
  const CRUDApp({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        home: MultiBlocProvider(providers: [
          BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>())
        ], child: const HomePage()));
  }
}
