import 'package:catering_flutter_frontend/models/cateringProduct.dart';

String productPriceToString(double price) {
  // return price.toInt() == price.floor() || price.toInt() == price.ceil()
  //     ? price.toInt().toString()
  //     : price.toString();
  return price.toString();
}

double getTotalPriceOfOrder(var cateringProducts) {
  double totalPrice = 0;

  for (var product in cateringProducts) {
    if (product.amount > 0) {
      totalPrice += product.amount * product.price;
    }
  }

  return totalPrice;
}

List<CateringProduct> getAddedProductsFromOrder(var cateringProducts) {
  List<CateringProduct> products = [];

  for (var product in cateringProducts) {
    if (product.amount > 0) {
      products.add(product);
    }
  }

  return products;
}
