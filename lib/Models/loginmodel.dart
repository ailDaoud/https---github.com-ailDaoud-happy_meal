// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class FirstRespons {
  final List data;
  final String message;
  final int code;

  FirstRespons({required this.data, required this.message, required this.code});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'message': message,
      'code': code,
    };
  }

  factory FirstRespons.fromMap(Map<String, dynamic> map) {
    return FirstRespons(
      data: List.from((map['data'] as List)),
      message: map['message'] ?? '',
      code: map['code'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory FirstRespons.fromJson(String source) => FirstRespons.fromMap(json.decode(source) as Map<String, dynamic>);
}
