import 'package:flutter/material.dart';

class TopTabBar extends StatelessWidget {
  const TopTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorWeight: 0,
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(child: Text('Meals')),
          Tab(child: Text('Snacks')),
          Tab(child: Text('Sweets')),
          Tab(child: Text('Drinks')),
        ]);
  }
}
