import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/Models/Prodactmodel.dart';
import 'package:flutter_application_1/Repository/ContentRep.dart';
import 'package:flutter_application_1/main.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ContantRep contantRep = ContantRep();
  ProductBloc() : super(ProductInitial()) {
    on<GetProduct>(getproduct);
  }
    FutureOr<void> getproduct(
      GetProduct event, Emitter<ProductState> emit) async {
    int id = sharedPreferences!.getInt("proid") ?? 0;
    GetProdacts getProdacts = GetProdacts();
    try {
      getProdacts = await contantRep.fetchproduct(id);
      if (getProdacts == null) {
        emit(LoadingProduct());
      } else {
        emit(GetProductSucsess(getProdacts: getProdacts));
      }
    } catch (e) {
      emit(CetProductFailed("Error"));
    }
  }
}
