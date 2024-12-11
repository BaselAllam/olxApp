

class ProductModel {

  String productId;
  String productName;
  String productDescription;
  num productPrice;
  String productImg;
  bool isFav;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImg,
    this.isFav = false
  });
}