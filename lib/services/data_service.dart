import 'dart:convert';
// import 'dart:io';

import 'package:aeguana/models/meal_item_model.dart';
import 'package:flutter/services.dart';

class DataService {
  Future<MealItemList> getMealItemsData() async {
    var data = await rootBundle.loadString('lib/ui/assets/meal_item_data.json');
    final jsonData = await json.decode(data);
    return MealItemList.fromJson(jsonData);
  }

}
