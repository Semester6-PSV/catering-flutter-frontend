import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
import 'package:catering_flutter_frontend/components/searchInput.dart';
class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  void SearchProductsByKeyword(String keyword) {
    return; 
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: COLOR_RED_DARK,
                title: const Text('Bestel online je eten of drinken',
                    style: TextStyle(fontFamily: 'Klavika-Medium'))),
            body: Container(
                width: size.width,
                height: size.height,
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
                      onChange: SearchProductsByKeyword,
                    )
                  ],
                ))));
  }
}
