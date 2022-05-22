import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';
import 'package:catering_flutter_frontend/components/button.dart';

Widget orderBottomModal(var cateringProducts, Function() onFinish) {
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

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(30),
    decoration: const BoxDecoration(
      color: COLOR_WHITE,
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Je bestelling',
          style: TextStyle(fontFamily: 'Klavika-Medium', fontSize: 28)),
      const SizedBox(height: 20),
      const Text('Bestelde producten',
          style: TextStyle(fontFamily: 'Klavika-Light', fontSize: 20)),
      const SizedBox(height: 10),
      SizedBox(width: double.infinity, child: Column(children: addedProducts)),
      const SizedBox(height: 30),
      Container(
          width: double.infinity,
          height: 2,
          color: const Color.fromRGBO(219, 219, 219, 1)),
      const SizedBox(height: 20),
      Align(
          alignment: Alignment.centerRight,
          child: Text('Totaal €' + totalPrice.toString(),
              style:
                  const TextStyle(fontFamily: 'Klavika-Medium', fontSize: 20))),
      const SizedBox(height: 20),
      Row(children: [
        Expanded(
            child: CustomButton(
                text: 'Bestelling afronden',
                type: ButtonType.primary,
                onClick: onFinish))
      ])
    ]),
  );
}
