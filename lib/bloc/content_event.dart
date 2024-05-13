part of 'content_bloc.dart';

sealed class ContentEvent extends Equatable {
  const ContentEvent();

  @override
  List<Object> get props => [];
}



class GetsubCategories extends ContentEvent{
}
class GetProduct extends ContentEvent{}