import 'package:aeguana/models/meal_item_model.dart';
import 'package:aeguana/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealItemCard extends StatelessWidget {
  MealItemCard(this._mealItemModel, {super.key});

  final MealItemModel _mealItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(imgSaladPng),
          Flexible(
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Column(children: [
                Text(
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    '${_mealItemModel.categoryDisplay} ${_mealItemModel.name}'),
                Text(
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    _mealItemModel.description),
                getPrice(_mealItemModel)
              ]),
            ),
          ),
          Container(
              child: _mealItemModel.itemsLeft == 0
                  ? const Text('SOLD OUT')
                  : Image.asset(imgplusPng)),
        ],
      ),
    );
  }

  Widget getPrice(MealItemModel mealItemModel) {
    if (mealItemModel.discount == 0 || mealItemModel.discount == null) {
      return Text('${mealItemModel.price.toStringAsFixed(2)} €');
    } else {
      return Row(children: [
        Text(
          style: GoogleFonts.inter(
              decoration: TextDecoration.lineThrough,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          '${mealItemModel.price.toStringAsFixed(2)} €',
        ),
        Text(
          ' ${(mealItemModel.price! - mealItemModel.discount!).toStringAsFixed(2).toString()} €',
          style: const TextStyle(color: Colors.red),
        ),
      ]);
    }
  }
}
