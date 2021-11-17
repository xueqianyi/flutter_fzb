import 'dart:convert';

EnrollModel enrollModelFromJson(String str) => EnrollModel.fromJson(json.decode(str));

String enrollModelToJson(EnrollModel data) => json.encode(data.toJson());

class EnrollModel {
  EnrollModel({
    this.err,
    this.msg,
  });

  int err;
  String msg;

  factory EnrollModel.fromJson(Map<String, dynamic> json) => EnrollModel(
    err: json["err"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "err": err,
    "msg": msg,
  };
}