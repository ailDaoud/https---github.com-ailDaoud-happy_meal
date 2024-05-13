part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
  
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}
class LoadingCategories extends CategoryState {}

class Cetcategoriessucsess extends CategoryState {
  final Categoryy categoryy;

  Cetcategoriessucsess(this.categoryy);
}

class CetcategoriesFailed extends CategoryState {
  final String message;

  CetcategoriesFailed(this.message);
}
