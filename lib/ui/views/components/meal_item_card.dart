import 'package:aeguana/models/meal_item_model.dart';
import 'package:flutter/material.dart';

class MealitemCard extends StatelessWidget {
  MealitemCard(this._mealItemModel, {super.key});

  late MealItemModel _mealItemModel;
  String saladPng = 'lib/ui/assets/salad.png';
  String plusPng = 'lib/ui/assets/plus_icon.png';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(saladPng),
        Flexible(
          child: SizedBox(
            width: double.infinity,
            height: 100,
            child: Column(children: [
              Text('${_mealItemModel.categoryDisplay} ${_mealItemModel.name}'),
              Text(_mealItemModel.description),
              getPrice(_mealItemModel)
            ]),
          ),
        ),
        Container(
            child: _mealItemModel.itemsLeft == 0
                ? const Text('SOLD OUT')
                : Image.asset(plusPng)),
      ],
    );
  }

  Widget getPrice(MealItemModel mealItemModel) {
    if (mealItemModel.discount == 0 || mealItemModel.discount == null) {
      return Text('${mealItemModel.price.toStringAsFixed(2)} €');
    } else {
      return Row(children: [
        Text('${mealItemModel.price.toStringAsFixed(2)} €',
            style: const TextStyle(decoration: TextDecoration.lineThrough)),
        Text(
          ' ${(mealItemModel.price!- mealItemModel.discount!).toStringAsFixed(2).toString()} €',
          style:  const TextStyle(color: Colors.red),
        ), 
      ]);
    }
  }
}
