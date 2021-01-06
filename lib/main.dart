import 'package:coffee_Shop_UI/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Ui practice',
      home: DashboardPage(),
    );
  }
}