import 'package:aeguana/models/category_enum.dart';

class MealItemModel {
  MealItemModel();
  int id = -1;
  Category category = Category.Unknown;
  String categoryDisplay = '';
  String name = '';
  String description = '';
  double price = 0;
  double? discount;
  int? itemsLeft;

  MealItemModel.fromJson(Map<String, dynamic> json) {
    var id = json['id'];
    category = getEnumFromString(json['category']);
    categoryDisplay = json['category'];
    name = json['name'];
    description = json['description'];
    price = json['price'].toDouble();
    discount = json['discount'].toDouble();
    itemsLeft = json['items_left'];
  }
}

class MealItemList {
  final List<MealItemModel> mealItems;
  MealItemList({required this.mealItems});

  factory MealItemList.fromJson(Map<String, dynamic> json) {
    final List<dynamic> items = json['meal_item'];
    List<MealItemModel> mealItems =
        items.map((item) => MealItemModel.fromJson(item)).toList();
    return MealItemList(mealItems: mealItems);
  }
}
