import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:catering_flutter_frontend/pages/orderOverviewPage/components/openOrderBox.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';

class OrderOverviewPage extends StatefulWidget {
  final IO.Socket socket;
  
  const OrderOverviewPage({Key? key, required this.socket}) : super(key: key);

  @override
  OrderOverviewPageState createState() => OrderOverviewPageState();
}

class OrderOverviewPageState extends State<OrderOverviewPage> {
  @override
  Widget build(BuildContext context) {
    final routeArguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: COLOR_RED_DARK,
          title: const Text('Openstaande bestellingen',
              style: TextStyle(fontFamily: 'Klavika-Medium'))),
      body: Column(children: [
        Expanded(
            child: SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    color: COLOR_WHITE,
                    padding: const EdgeInsets.fromLTRB(gridPadding,
                        gridPadding * 2, gridPadding, gridPadding * 2),
                    child: Column(
                      children: [
                        OpenOrderBox(
                            orderId: 25356,
                            cateringProducts:
                                routeArguments['cateringProducts']),
                      ],
                    ))))
      ]),
    ));
  }
}
