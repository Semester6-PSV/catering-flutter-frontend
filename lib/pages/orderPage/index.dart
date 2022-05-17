import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
import 'package:catering_flutter_frontend/components/searchInput.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  final double gridPadding = 20.0;
  int activeProductSelector = 0;

  void searchProductsByKeyword(String keyword) {
    return;
  }

  void switchProductsTypeSelector() {
    setState(() {
      activeProductSelector = activeProductSelector == 0 ? 1 : 0;

      //TODO - Also update product list according to selected product type ("eten" or "drinken")
    });
  }

  Widget productSelector(String title, int index) {
    String fontFamily = 'Klavika-Light';

    if (index == activeProductSelector) {
      fontFamily = 'Klavika-Medium';
    }

    // return TextButton(
    //   child: Text(
    //     title,
    //     style:
    //         TextStyle(fontFamily: fontFamily, fontSize: 18, color: COLOR_WHITE,),
    //   ),
    //   onPressed: () {
    //     if (index != activeProductSelector) {
    //       switchProductsTypeSelector();
    //     }
    //   },
    //);

    return InkWell(
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: 18,
            color: COLOR_WHITE,
          ),
        )),
        onTap: () {
          if (index != activeProductSelector) {
            switchProductsTypeSelector();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: COLOR_RED_DARK,
                title: const Text('Bestel online je eten of drinken',
                    style: TextStyle(fontFamily: 'Klavika-Medium'))),
            body: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                color: COLOR_WHITE,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Stel je bestelling samen',
                            style: TextStyle(
                                fontFamily: 'Klavika-Medium', fontSize: 22),
                          )),
                      const SizedBox(height: 15),
                      SearchInput(
                        placeholder: 'Zoek een product',
                        onChange: searchProductsByKeyword,
                      ),
                      const SizedBox(height: 30),
                      AnimatedContainer(
                          height: 45,
                          duration: const Duration(milliseconds: 400),
                          decoration: const BoxDecoration(
                              color: COLOR_GREY,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          child: Row(children: [
                            Expanded(child: productSelector('Eten', 0)),
                            VerticalDivider(
                              width: gridPadding,
                            ),
                            Expanded(child: productSelector('Drinken', 1)),
                          ], mainAxisAlignment: MainAxisAlignment.center)),
                      const SizedBox(height: 20),
                    ]))));
  }
}
