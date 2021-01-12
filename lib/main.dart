import 'package:flutter/material.dart';
import 'package:house_mobile/pages/login.page.dart';
import 'package:house_mobile/pages/map.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'house',
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/map': (context) => HouseMap(),
      },
    );
  }
}
