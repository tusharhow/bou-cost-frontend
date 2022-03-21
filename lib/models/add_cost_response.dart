// To parse this JSON data, do
//
//     final addCostResponse = addCostResponseFromJson(jsonString);

import 'dart:convert';

AddCostResponse addCostResponseFromJson(String str) => AddCostResponse.fromJson(json.decode(str));

String addCostResponseToJson(AddCostResponse data) => json.encode(data.toJson());

class AddCostResponse {
    AddCostResponse({
       required this.message,
      required  this.status,
    });

    String message;
    String status;

    factory AddCostResponse.fromJson(Map<String, dynamic> json) => AddCostResponse(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}
