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
  
  void dispose() {
    _mealItemBehavior.close();
  }
}
