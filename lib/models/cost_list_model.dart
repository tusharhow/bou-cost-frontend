// To parse this JSON data, do
//
//     final costListModel = costListModelFromJson(jsonString);

import 'dart:convert';

CostListModel costListModelFromJson(String str) => CostListModel.fromJson(json.decode(str));

String costListModelToJson(CostListModel data) => json.encode(data.toJson());

class CostListModel {
    CostListModel({
      required  this.data,
      required  this.status,
    });

    List<Datum> data;
    String status;

    factory CostListModel.fromJson(Map<String, dynamic> json) => CostListModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
    };
}

class Datum {
    Datum({
    required    this.id,
     required   this.cost,
     required   this.costType,
     required   this.costDate,
     required   this.costDescription,
    });

    String id;
    int cost;
    String costType;
    String costDate;
    String costDescription;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        cost: json["cost"],
        costType: json["costType"],
        costDate: json["costDate"],
        costDescription: json["costDescription"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cost": cost,
        "costType": costType,
        "costDate": costDate,
        "costDescription": costDescription,
    };
}
