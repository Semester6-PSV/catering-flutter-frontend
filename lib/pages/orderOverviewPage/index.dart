import 'package:catering_flutter_frontend/models/cateringOrder.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';

import 'components/openOrderBox.dart';

Column getOpenOrderBoxList(List<CateringOrder> openOrders) {
  List<Widget> openOrderBoxes = [];

  for (var order in openOrders) {
    openOrderBoxes.add(OpenOrderBox(order: order));
  }

  return Column(children: openOrderBoxes);
}

class OrderOverviewPage extends StatefulWidget {
  final IO.Socket socket;

  const OrderOverviewPage({Key? key, required this.socket}) : super(key: key);

  @override
  OrderOverviewPageState createState() => OrderOverviewPageState();
}

class OrderOverviewPageState extends State<OrderOverviewPage> {
  List<CateringOrder> orders = [];
  bool initOrdersSet = false;

  @override
  void initState() {
    super.initState();

    widget.socket.on('update-orders', (orders) {
      print(orders);
      if (mounted) {
        setState(() {
          orders = orders;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

        setState(() {
          orders = routeArguments['openOrders'];
        });

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
                    child: getOpenOrderBoxList(orders))))
      ]),
    ));
  }
}
