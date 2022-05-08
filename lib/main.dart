import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
import 'dart:developer' as developer;

void main() {
  runApp(const CateringApp());
}

class CateringApp extends StatelessWidget {
  const CateringApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catering App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: COLOR_RED,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: COLOR_GREY)),
      home: OrderPage(),
    );
  }
}