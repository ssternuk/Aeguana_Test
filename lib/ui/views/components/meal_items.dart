import 'package:aeguana/core/blocs/meal_bloc.dart';
import 'package:aeguana/models/meal_item_model.dart';
import 'package:aeguana/ui/constants.dart';
import 'package:aeguana/ui/views/components/meal_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grouped_list/grouped_list.dart';

class MealItems extends StatefulWidget {
  MealItems({super.key}) {
    _mealBloc = GetIt.instance<MealBloc>();
  }

  late MealBloc _mealBloc;

  @override
  State<MealItems> createState() => _MealItemsState();
}

class _MealItemsState extends State<MealItems> {
  @override
  void initState() {
    super.initState();
    widget._mealBloc.getMealItems();
  }

  String saladPng = 'lib/ui/assets/salad.png';
  String plusPng = 'lib/ui/assets/plus_icon.png';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MealItemList?>(
        stream: widget._mealBloc.mealItemStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var mealItems = snapshot.data!.mealItems;
            return Expanded(
                child: Container(
              color: clrBackgroundGrey,
              padding: EdgeInsets.all(8),
              child: GroupedListView(
                  separator: SizedBox(height: 14, width: double.infinity),
                  elements: mealItems,
                  groupHeaderBuilder: (element) => Text(
                      style: TextStyle(
                          fontFamily: 'Futura-Bd',
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      element.categoryDisplay),
                  shrinkWrap: true,
                  groupBy: (element) => element.category.toString(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, element) => MealItemCard(element)),
            ));
          } else {
            return Container();
          }
        });
  }
}
