import 'crud/domain/usecase/add_product.dart';
import 'crud/data/datasource/product_remote_data_source.dart';
import 'crud/data/repository/product_repository_impl.dart';
import 'crud/domain/repository/product_repository.dart';
import 'crud/domain/usecase/delete_product.dart';
import 'package:get_it/get_it.dart';
import 'core/network/network_info.dart';
import 'crud/domain/usecase/update_product.dart';
import 'crud/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => ProductBloc(
      add: sl(),
      update: sl(),
      del: sl(),

    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AddProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImple(
      productRemoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}