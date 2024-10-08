// To parse this JSON data, do
//
//     final allDepModel = allDepModelFromJson(jsonString);

import 'dart:convert';

AllDepModel allDepModelFromJson(String str) => AllDepModel.fromJson(json.decode(str));

String allDepModelToJson(AllDepModel data) => json.encode(data.toJson());

class AllDepModel {
  bool status;
  String message;
  List<Datum> data;

  AllDepModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllDepModel.fromJson(Map<String, dynamic> json) => AllDepModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  int number;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.name,
    required this.number,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    number: json["number"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "number": number,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
