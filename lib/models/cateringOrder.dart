import 'package:catering_flutter_frontend/config/enums.dart';
import 'package:catering_flutter_frontend/models/cateringProduct.dart';

class CateringOrder {
  final int id;
  final double totalPrice;
  final List<CateringProduct> addedProducts;
  final bool done;
  final bool scanned;

  CateringOrder(
      {required this.id,
      required this.totalPrice,
      required this.addedProducts,
      required this.done,
      required this.scanned});

  Map toJson() => {
        'id': id.toString(),
        'totalPrice': totalPrice.toString(),
        'addedProducts': addedProducts
      };

  static decode(data) {
    List<CateringProduct> addedProducts = [];

    for (var product in data['addedProducts']) {
      // CateringProductType type = CateringProductType.values.firstWhere((e) => if() {e.toString() == product['productType']);
      addedProducts.add(CateringProduct(
          id: int.parse(product['id']),
          title: product['title'],
          price: double.parse(product['price']),
          image: product['image'],
          productType: CateringProductType.food,
          amount: product['amount']));
    }

    return CateringOrder(
        id: data['id'],
        totalPrice: double.parse(data['totalPrice'].toString()),
        addedProducts: addedProducts,
        done: false,
        scanned: false);
  }
}
