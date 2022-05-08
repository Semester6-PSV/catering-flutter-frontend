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
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: COLOR_RED_DARK,
                title: const Text('Test App Bar',
                    style: TextStyle(fontFamily: 'Klavika-Medium'))),
            body: Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                color: COLOR_WHITE,
                child: Text(
                  'PSV Catering',
                  style: TextStyle(fontFamily: 'Klavika-Bold'),
                ))));
  }
}
