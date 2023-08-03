import 'package:aeguana/ui/constants.dart';
import 'package:aeguana/ui/views/components/meal_items.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

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
        setState(() => _tabIndex = tabController.index);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 14, 16, 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: clrGrey),
          height: 40,
          child: TabBar(
              indicatorWeight: 0,
              controller: tabController,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              labelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              tabs: [
                tabTitle('Meals'),
                tabTitle('Snacks'),
                tabTitle('Sweets'),
                tabTitle('Drinks'),
              ]),
        ),
        MealItems(),
      ],
    );
  }

  Widget tabTitle(String title) {
    return Tab(
      child:
          SizedBox(width: 120, child: Text(textAlign: TextAlign.center, title)),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
