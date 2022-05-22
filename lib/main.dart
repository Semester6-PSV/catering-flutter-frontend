import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
import 'package:catering_flutter_frontend/pages/index.dart';

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
          splashColor: COLOR_GREY_LIGHT,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: COLOR_GREY)),
          initialRoute: '/orderPage',
          routes: <String, WidgetBuilder>{
            '/orderPage': (BuildContext context) => const OrderPage(),
            '/orderOverviewPage': (BuildContext context) => const OrderOverviewPage()
          },
    );
  }
}