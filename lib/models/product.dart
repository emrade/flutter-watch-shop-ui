import '../utils/utils.dart';

class Product {
  int id;
  String name;
  List<String> photos;
  List<String> colors;
  int price;
  String brand = "Daniel Wellington";

  Product({
    this.id,
    this.name,
    this.price,
    this.photos,
    this.colors,
  });
}

List<Product> products = [
  Product(
    id: 1,
    name: "Classic ST Mawes",
    price: 179,
    photos: [AppImages.watch10, AppImages.watch11],
    colors: ["#E5AE87", "#C1C1C1"],
  ),
  Product(
    id: 2,
    name: "Classic Bayswater",
    price: 159,
    photos: [AppImages.watch20, AppImages.watch21],
    colors: ["#E5AE87", "#C1C1C1"],
  ),
  Product(
    id: 3,
    name: "Classic Roselyn",
    price: 159,
    photos: [AppImages.watch30, AppImages.watch31],
    colors: ["#E5AE87", "#C1C1C1"],
  ),
  Product(
    id: 4,
    name: "Classic Cambridge",
    price: 177,
    photos: [AppImages.watch40, AppImages.watch41],
    colors: ["#E5AE87", "#C1C1C1"],
  ),
];
