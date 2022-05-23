import 'package:catering_flutter_frontend/models/cateringProduct.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';

Widget orderedCateringProductsList(var cateringProducts) {
  List<CateringProduct> addedOrderProducts =
      getAddedProductsFromOrder(cateringProducts);
  List<Widget> addedProductsWidget = <Widget>[];

  for (var product in addedOrderProducts) {
    addedProductsWidget.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(product.amount.toString(),
                style: const TextStyle(
                    fontFamily: 'Klavika-Medium', fontSize: 20)),
            const SizedBox(width: 10),
            Text(product.title,
                style:
                    const TextStyle(fontFamily: 'Klavika-Light', fontSize: 20))
          ],
        ),
        Expanded(
            child: Align(
          alignment: Alignment.centerRight,
          child: Text(
              '€' + productPriceToString(product.amount * product.price),
              style:
                  const TextStyle(fontFamily: 'Klavika-Medium', fontSize: 20)),
        )),
        const SizedBox(height: 30)
      ],
    ));
  }

  return Column(children: addedProductsWidget);
}
