import 'package:aeguana/models/category_enum.dart';
import 'package:aeguana/models/meal_item_model.dart';
import 'package:aeguana/services/data_service.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class MealBloc {
  MealBloc() {
    _mealItemBehavior = BehaviorSubject<MealItemList?>.seeded(mealItemModel);
    _dataService = GetIt.instance<DataService>();
  }

  late BehaviorSubject<MealItemList?> _mealItemBehavior;
  MealItemList? mealItemModel;
  late DataService _dataService;
  Stream<MealItemList?> get mealItemStream => _mealItemBehavior.stream;

  Future<void> getMealItems() async {
    var mealItems = await _dataService.getMealItemsData();
    _mealItemBehavior.sink.add(mealItems);
  }

  Future<void> filterBy(Category filterCategory) async {
    var mealItemModel = await _dataService.getMealItemsData();

    if (filterCategory != Category.Meals) {
      var mealItemsFilter = mealItemModel.mealItems
          .where((i) => i.category == filterCategory)
          .toList();
      _mealItemBehavior.sink.add(MealItemList(mealItems: mealItemsFilter));
    } else {
      _mealItemBehavior.sink
          .add(MealItemList(mealItems: mealItemModel.mealItems));
    }
  }

  void dispose() {
    _mealItemBehavior.close();
  }
}
