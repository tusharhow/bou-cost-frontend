import 'package:flutter/cupertino.dart';

class AddCostController extends ChangeNotifier{
  
  Future<void> addCost(int cost, String costType, String date,String desc) async{
    await Future.delayed(Duration(seconds: 1));
    notifyListeners();
  }
}