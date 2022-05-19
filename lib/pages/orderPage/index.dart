import 'package:catering_flutter_frontend/models/cateringProduct.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
import 'package:catering_flutter_frontend/components/searchInput.dart';
import 'package:catering_flutter_frontend/pages/orderPage/components/cateringProductListView.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  double gridPadding = 15;
  int activeProductSelector = 0;
  List<CateringProduct> cateringProducts = dummyCateringProducts;
  CateringProductType selectedProductsType = CateringProductType.food;

  void searchProductsByKeyword(String keyword) {
    return;
  }

  void switchProductsTypeSelector() {
    setState(() {
      if(activeProductSelector == 0){
        activeProductSelector = 1;
        selectedProductsType = CateringProductType.drinks;
      }
      else{
        activeProductSelector = 0;
        selectedProductsType = CateringProductType.food;

      }
    });
  }

  void onProductItemRemove(int productId) {print('remove product item');}

  void onProductItemAdd(int productId) {print('add product item');}

  Widget productSelector(String title, int index) {
    String fontFamily = 'Klavika-Light';

    if (index == activeProductSelector) {
      fontFamily = 'Klavika-Medium';
    }

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
            body: SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
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
                                borderRadius: BorderRadius.all(
                                    Radius.circular(borderRadius))),
                            child: Row(children: [
                              Expanded(child: productSelector('Eten', 0)),
                              VerticalDivider(
                                width: gridPadding,
                              ),
                              Expanded(child: productSelector('Drinken', 1)),
                            ], mainAxisAlignment: MainAxisAlignment.center)),
                        const SizedBox(height: 20),
                        cateringProductListView(cateringProducts, selectedProductsType, onProductItemRemove, onProductItemAdd)
                      ])),
            )));
  }
}
