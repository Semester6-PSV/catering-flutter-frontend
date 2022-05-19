import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
import 'package:catering_flutter_frontend/models/cateringProduct.dart';

String productPriceToString(double price) {
  // return price.toInt() == price.floor() || price.toInt() == price.ceil()
  //     ? price.toInt().toString()
  //     : price.toString();
  return price.toString();
}

Widget productRemoveAddButton(int productId, IconData icon, Function onClick) {
  return InkWell(
      child: SizedBox(
        width: 25,
        height: 25,
        child: Container(
          decoration: const BoxDecoration(
              color: COLOR_RED,
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius / 2))),
          child: Icon(
            icon,
            color: COLOR_WHITE,
            size: 16,
          ),
        ),
      ),
      onTap: () =>{ onClick(productId) });
}

Widget cateringProductListView(List<CateringProduct> products, double padding,
    Function onItemRemove, Function onItemAdd) {
  List<Widget> productItems = <Widget>[];

  for (int i = 0; i < products.length; i++) {
    CateringProduct product = products[i];

    productItems.add(Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.only(bottom: padding),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                color: COLOR_BLACK.withOpacity(0.25),
                blurRadius: 2)
          ],
          borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
          color: COLOR_WHITE),
      child: Row(
        children: [
          Column(
            children: [
              Expanded(
                  child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  child: const Center(
                    child: Text(
                      'Foto',
                      style: TextStyle(
                        fontFamily: 'Klavika-Medium',
                        fontSize: 18,
                        color: COLOR_WHITE,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: COLOR_GREY_LIGHT,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(borderRadius),
                          bottomLeft: Radius.circular(borderRadius))),
                ),
              ))
            ],
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Center(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.title,
                              style: const TextStyle(
                                fontFamily: 'Klavika-Medium',
                                fontSize: 18,
                                color: COLOR_BLACK,
                              )),
                          Row(
                            children: [
                              const Text('€ ',
                                  style: TextStyle(
                                    fontFamily: 'Klavika-Medium',
                                    fontSize: 18,
                                    color: COLOR_RED,
                                  )),
                              Text(productPriceToString(product.price),
                                  style: const TextStyle(
                                    fontFamily: 'Klavika-Medium',
                                    fontSize: 18,
                                    color: COLOR_BLACK,
                                  ))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text('€ ',
                                  style: TextStyle(
                                      fontFamily: 'Klavika-Light',
                                      fontSize: 18,
                                      color: COLOR_RED)),
                              Text(productPriceToString(product.price),
                                  style: const TextStyle(
                                      fontFamily: 'Klavika-Light',
                                      fontSize: 18,
                                      color: COLOR_BLACK))
                            ],
                          ),
                          Row(
                            children: [
                              productRemoveAddButton(product.id, 
                                  Icons.remove_outlined, onItemRemove),
                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Text('0',
                                      style: TextStyle(
                                        fontFamily: 'Klavika-Medium',
                                        fontSize: 16,
                                        color: COLOR_BLACK,
                                      ))),
                              productRemoveAddButton(product.id,
                                  Icons.add_outlined, onItemAdd),
                            ],
                          )
                        ],
                      )
                    ],
                  ))))
        ],
      ),
    ));
  }

  return Column(
    children: productItems,
  );
}
