import 'package:equatable/equatable.dart';
//Like model use in Presentation Layer//

class Categories extends Equatable {
  final int id;
  final String name;
  final String image;

  Categories({
    required this.id,
    required this.name,
    required this.image,
  });
  @override
  List<Object?> get props => [id,name,image];
}
/*class Categoryy {
 // Data? data;
  Categoryy({
   this.data,
  });
}*/