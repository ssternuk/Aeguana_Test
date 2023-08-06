import 'package:aeguana/core/blocs/meal_bloc.dart';
import 'package:aeguana/models/category_enum.dart';
import 'package:aeguana/ui/constants.dart';
import 'package:aeguana/ui/views/components/meal_items.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key}) {
    _mealBloc = GetIt.instance<MealBloc>();
  }

  late MealBloc _mealBloc;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        var tabIndex = [
          Category.Meals,
          Category.Snacks,
          Category.Sweets,
          Category.Drinks
        ];

        var index = tabController.index;
        widget._mealBloc.filterBy(tabIndex[index]);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tabBar(),
        MealItems(),
      ],
    );
  }

  Container tabBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: clrBackgroundGrey),
      height: 40,
      padding: EdgeInsets.all(4),
      child: TabBar(
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          controller: tabController,
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          labelColor: Colors.black,
          labelStyle: const TextStyle(
              fontFamily: 'Futura-Md-BT',
              fontSize: 14,
              fontWeight: FontWeight.w400),
          unselectedLabelColor: clrGrey,
          tabs: [
            tabTitle('Meals'),
            tabTitle('Snacks'),
            tabTitle('Sweets'),
            tabTitle('Drinks'),
          ]),
    );
  }

  Widget tabTitle(String title) {
    return Tab(
      child: Container(
          width: double.infinity,
          child: Text(textAlign: TextAlign.center, title)),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
