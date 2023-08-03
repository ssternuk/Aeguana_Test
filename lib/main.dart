import 'package:aeguana/services/service_locator.dart';
import 'package:aeguana/ui/constants.dart';
import 'package:aeguana/ui/views/bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  // ignore: unnecessary_statements

  WidgetsFlutterBinding.ensureInitialized();
  runApp(AeguanaApp());
}

class AeguanaApp extends StatelessWidget {
  AeguanaApp({super.key}) {
    ServiceLocator().registerSingletons();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:clrPrimary),
        useMaterial3: true,
      ),
      home: BottomNavigation(),
    );
  }
}

