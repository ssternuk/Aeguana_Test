import 'package:aeguana/ui/constants.dart';
import 'package:aeguana/ui/views/account_view.dart';
import 'package:aeguana/ui/views/home_view.dart';
import 'package:aeguana/ui/views/pay_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: PersistentTabView(
          context,
          controller: _controller,
          decoration: NavBarDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
            ),
          ]),
          items: _navBarItems(),
          screens: _widgetOptions,
          navBarStyle: NavBarStyle.style15,
        ));
  }

  final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    PayView(),
    AccountView()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(imgHomeIconPng),
        title: 'Home',
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(imgPayIconPng),
        title: 'Pay',
        activeColorPrimary: Colors.white, // Default is Colors.white.
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(imgAccountIconPng),
        title: 'Account',
      ),
    ];
  }
}
