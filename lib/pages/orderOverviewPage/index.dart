import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
class OrderOverviewPage extends StatefulWidget {
  const OrderOverviewPage({Key? key}) : super(key: key);

  @override
  OrderOverviewPageState createState() => OrderOverviewPageState();
}

class OrderOverviewPageState extends State<OrderOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: COLOR_RED_DARK,
            title: const Text('Openstaande bestellingen',
                style: TextStyle(fontFamily: 'Klavika-Medium'))),
        body: Column(children: []),
      ),
    );
  }
}
