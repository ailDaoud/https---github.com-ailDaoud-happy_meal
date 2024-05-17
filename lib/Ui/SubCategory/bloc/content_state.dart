part of 'content_bloc.dart';

sealed class ContentState extends Equatable {
  const ContentState();

  @override
  List<Object> get props => [];
}

final class ContentInitial extends ContentState {}

class LoadingSubCategories extends ContentState {}

class CetSubcategoriessucsess extends ContentState {
  final List<Datum> subcategory;

  const CetSubcategoriessucsess(this.subcategory);
}

class CetSubcategoriesFailed extends ContentState {
  final String message;

  const CetSubcategoriesFailed(this.message);
}

