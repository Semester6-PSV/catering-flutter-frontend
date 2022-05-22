import 'package:catering_flutter_frontend/models/cateringProduct.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
import 'package:catering_flutter_frontend/components/searchInput.dart';
import 'package:catering_flutter_frontend/components/button.dart';

import 'components/cateringProductListView.dart';

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
      if (activeProductSelector == 0) {
        activeProductSelector = 1;
        selectedProductsType = CateringProductType.drinks;
      } else {
        activeProductSelector = 0;
        selectedProductsType = CateringProductType.food;
      }
    });
  }

  void onProductItemRemove(int productId) {
    for (var product in cateringProducts) {
      if (product.id == productId) {
        if (product.amount != 0) {
          setState(() {
            product.amount -= 1;
          });
        }
      }
    }
  }

  void onProductItemAdd(int productId) {
    for (var product in cateringProducts) {
      if (product.id == productId) {
        setState(() {
          product.amount += 1;
        });
      }
    }
  }

  void openOrderPopup(context) {
    List<Widget> addedProducts = <Widget>[];
    double totalPrice = 0;

    for (var product in cateringProducts) {
      if (product.amount > 0) {
        totalPrice += product.amount * product.price;

        addedProducts.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(product.amount.toString(),
                    style: const TextStyle(
                        fontFamily: 'Klavika-Medium', fontSize: 20)),
                const SizedBox(width: 10),
                Text(product.title,
                    style: const TextStyle(
                        fontFamily: 'Klavika-Light', fontSize: 20))
              ],
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                  '€' + productPriceToString(product.amount * product.price),
                  style: const TextStyle(
                      fontFamily: 'Klavika-Medium', fontSize: 20)),
            )),
            const SizedBox(height: 30)
          ],
        ));
      }
    }

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: COLOR_WHITE,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Je bestelling',
                  style: TextStyle(fontFamily: 'Klavika-Medium', fontSize: 28)),
              const SizedBox(height: 20),
              const Text('Bestelde producten',
                  style: TextStyle(fontFamily: 'Klavika-Light', fontSize: 20)),
              const SizedBox(height: 10),
              SizedBox(
                  width: double.infinity,
                  child: Column(children: addedProducts)),
              const SizedBox(height: 30),
              Container(
                  width: double.infinity,
                  height: 2,
                  color: const Color.fromRGBO(219, 219, 219, 1)),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text('Totaal €' + totalPrice.toString(),
                      style: const TextStyle(
                          fontFamily: 'Klavika-Medium', fontSize: 20))),
              const SizedBox(height: 20),
              Row(children: [
                Expanded(
                    child: CustomButton(
                        text: 'Bestelling afronden',
                        type: ButtonType.primary,
                        onClick: routeToCheckoutPage))
              ])
            ]),
          );
        });
  }

  void routeToCheckoutPage() {
    return;
  }

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
            body: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                        gridPadding, gridPadding, gridPadding, gridPadding * 2),
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
                          cateringProductListView(
                              cateringProducts,
                              selectedProductsType,
                              onProductItemRemove,
                              onProductItemAdd)
                        ])),
              )),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: COLOR_WHITE, boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, -1),
                      color: COLOR_BLACK.withOpacity(0.25),
                      blurRadius: 2)
                ]),
                padding: EdgeInsets.all(gridPadding),
                child: Row(children: [
                  Expanded(
                      child: CustomButton(
                    text: 'Bekijk bestelling',
                    type: ButtonType.secondary,
                    onClick: () {
                      openOrderPopup(context);
                    },
                  )),
                  VerticalDivider(
                    width: gridPadding,
                  ),
                  Expanded(
                      child: CustomButton(
                    text: 'Bestelling afronden',
                    type: ButtonType.primary,
                    onClick: routeToCheckoutPage,
                  )),
                ]),
              ),
            ])));
  }
}
