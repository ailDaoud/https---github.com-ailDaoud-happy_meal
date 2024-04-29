// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Verify {
  final String error;
  final int code;

  Verify({required this.error, required this.code});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'code': code,
    };
  }

  factory Verify.fromMap(Map<String, dynamic> map) {
    return Verify(
      error: map['error'] as String,
      code: map['code'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Verify.fromJson(String source) => Verify.fromMap(json.decode(source) as Map<String, dynamic>);
}

