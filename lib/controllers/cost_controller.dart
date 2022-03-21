import 'dart:convert';
import 'package:bou_cost/models/cost_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../models/add_cost_response.dart';

class CostController extends ChangeNotifier {
  Future<AddCostResponse> addCost(
      int cost, String costType, String date, String desc) async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8080/addCost"),
      body: json.encode({
        'cost': cost,
        'costType': costType,
        'costDate': date,
        'costDescription': desc,
      }),
    );
    if (response.statusCode == 200) {
      return AddCostResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add cost');
    }
  }

  var cost = <CostListModel>[];

  Future<CostListModel> getCost() async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8080/totalCost"),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return CostListModel.fromJson(json.decode(response.body));
     
    } else {
      throw Exception('Failed to get cost');
    }
   
  }

  Future deleteCost(String id) async {
    final response = await http.delete(
      Uri.parse("http://10.0.2.2:8080/deleteCost/$id"),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    
    } else {
      throw Exception('Failed to delete cost');
    }
   
  }
}
