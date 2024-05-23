import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/Models/caregoriesmodel.dart';
import 'package:flutter_application_1/Repository/ContentRep.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<GetCategories>(getCategories);
  }
  FutureOr<void> getCategories(
      GetCategories event, Emitter<CategoryState> emit) async {
    Categoryy categoryy = Categoryy();
    try {
      categoryy = await ContantRep().fetchcategories();
      if (categoryy.data == null) {
        emit(LoadingCategories());
      } else {
        emit(Cetcategoriessucsess(categoryy));
      }
    } catch (e) {
      emit(CetcategoriesFailed("mmmmmmmmmmmmmmmmmmm"));
    }
  }
}
