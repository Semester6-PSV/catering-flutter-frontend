import 'dart:ffi';

class CateringProduct {
  final String title;
  final double price;
  final String image;

  CateringProduct({
    required this.title,
    required this.price,
    required this.image,
  });
}

List<CateringProduct> dummyCateringProducts = [
  CateringProduct(title: 'Bier 0.5L', price: 5, image: ''),
  CateringProduct(title: 'Bier 0.2L', price: 2.75, image: ''),
  CateringProduct(title: 'Cola 0.2L', price: 2.75, image: ''),
  CateringProduct(title: 'Ice Tea 0.2L', price: 2.75, image: ''),
];