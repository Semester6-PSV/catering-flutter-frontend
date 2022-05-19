enum CateringProductType {
    drinks,
    food
}

class CateringProduct {
  final int id;
  final String title;
  final double price;
  final String image;
  final CateringProductType productType;

  CateringProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.productType
  });
}

List<CateringProduct> dummyCateringProducts = [
  CateringProduct(id: 0, title: 'Bier 0.5L', price: 5, image: '', productType: CateringProductType.drinks),
  CateringProduct(id: 1, title: 'Bier 0.2L', price: 2.75, image: '', productType: CateringProductType.drinks),
  CateringProduct(id: 2, title: 'Cola 0.2L', price: 2.75, image: '', productType: CateringProductType.drinks),
  CateringProduct(id: 3, title: 'Cola zero 0.2L', price: 2.75, image: '', productType: CateringProductType.drinks),
  CateringProduct(id: 4, title: 'Fanta 0.2L', price: 2.75, image: '', productType: CateringProductType.drinks),
  CateringProduct(id: 5, title: 'Ice Tea 0.2L', price: 2.75, image: '', productType: CateringProductType.drinks),
];