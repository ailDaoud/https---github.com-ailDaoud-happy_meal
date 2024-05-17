import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_application_1/Models/Subprodactsmodel.dart';

import 'package:flutter_application_1/Repository/ContentRep.dart';
import 'package:flutter_application_1/main.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContantRep contantRep = ContantRep();
  ContentBloc() : super(ContentInitial()) {
    on<GetsubCategories>(getsubgategories);
    
  }

  FutureOr<void> getsubgategories(
      GetsubCategories event, Emitter<ContentState> emit) async {
    int id = sharedPreferences!.getInt("kateid") ?? 2;
    List<Datum> subcategory = [];
    try {
      subcategory = await ContantRep().fetchsubcategories(id);
      if (subcategory.isEmpty) {
        emit(LoadingSubCategories());
      } else {
        emit(CetSubcategoriessucsess(subcategory));
      }
    } catch (e) {
      emit(CetSubcategoriesFailed("message"));
    }
  }


}
