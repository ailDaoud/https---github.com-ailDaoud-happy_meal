part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

class GetProductSucsess extends ProductState {
  final GetProdacts getProdacts;

  const GetProductSucsess({required this.getProdacts});
}

class CetProductFailed extends ProductState {
  final String message;

  const CetProductFailed(this.message);
}

class LoadingProduct extends ProductState {}
