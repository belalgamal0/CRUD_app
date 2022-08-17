import 'package:equatable/equatable.dart';
import '../../domain/entity/product.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ProductState {}

class Loading extends ProductState {}

class Loaded extends ProductState {

  Loaded();

  @override
  List<Object> get props => [];
}

class Error extends ProductState {
  final String message;

  Error({ required this.message});

  @override
  List<Object> get props => [message];
}