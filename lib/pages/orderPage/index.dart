import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
import 'package:catering_flutter_frontend/models/cateringProduct.dart';
import 'package:catering_flutter_frontend/components/searchInput.dart';
import 'package:catering_flutter_frontend/components/button.dart';
import 'package:catering_flutter_frontend/pages/orderPage/components/orderBottomModal.dart';
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

  void finishOrder() {
    return;
  }

  void openOrderPopup(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return orderBottomModal(cateringProducts, finishOrder);
        });
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
                    onClick: finishOrder,
                  )),
                ]),
              ),
            ])));
  }
}
