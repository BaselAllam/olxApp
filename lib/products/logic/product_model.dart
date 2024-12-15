

class ProductModel {

  String productId;
  String productName;
  String productDescription;
  num productPrice;
  String productImg;
  String categoryName;
  bool isFav;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImg,
    required this.categoryName,
    this.isFav = false
  });
}