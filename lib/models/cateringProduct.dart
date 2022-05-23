import 'package:catering_flutter_frontend/config/index.dart';
class CateringProduct {
  final int id;
  final String title;
  final double price;
  final String image;
  final CateringProductType productType;
  int amount;

  CateringProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.productType,
    required this.amount
  });

  Map toJson() => {
      'id': id.toString(),
      'title': title,
      'price': price.toString(),
      'image': image,
      'productType': productType.toString().split('.').last,
      'amount': amount
    };
}

List<CateringProduct> dummyCateringProducts = [
  CateringProduct(id: 6, title: 'Broodje kroket', price: 2.5, image: 'test', productType: CateringProductType.food, amount: 0),
  CateringProduct(id: 8, title: 'Broodje frikandel', price: 2.5, image: '', productType: CateringProductType.food, amount: 0),
  CateringProduct(id: 10, title: 'Kaassoufle', price: 1.5, image: '', productType: CateringProductType.food, amount: 0),
  CateringProduct(id: 7, title: 'Friet mayonaise', price: 2, image: '', productType: CateringProductType.food, amount: 0),
  CateringProduct(id: 9, title: 'Friet met curry', price: 2, image: '', productType: CateringProductType.food, amount: 0),

  CateringProduct(id: 0, title: 'Bier 0.5L', price: 5, image: '', productType: CateringProductType.drinks, amount: 0),
  CateringProduct(id: 1, title: 'Bier 0.2L', price: 2.75, image: '', productType: CateringProductType.drinks, amount: 0),
  CateringProduct(id: 2, title: 'Cola 0.2L', price: 2.75, image: '', productType: CateringProductType.drinks, amount: 0),
  CateringProduct(id: 3, title: 'Cola zero 0.2L', price: 2.75, image: '', productType: CateringProductType.drinks, amount: 0),
  CateringProduct(id: 4, title: 'Fanta 0.2L', price: 2.75, image: '', productType: CateringProductType.drinks, amount: 0),
  CateringProduct(id: 5, title: 'Ice Tea 0.2L', price: 2.75, image: '', productType: CateringProductType.drinks, amount: 0),
];