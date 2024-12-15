import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/products/logic/product_model.dart';
import 'package:olx/products/logic/product_state.dart';
import 'package:http/http.dart' as http;
import 'package:olx/shared/utils/app_assets.dart';
import 'dart:convert';


class ProductCubit extends Cubit<ProductState> {

  ProductCubit() : super(InitState());

  List<ProductModel> _userProducts = [];
  List<ProductModel> get userProducts => _userProducts;

  List<ProductModel> _allProducts = [];
  List<ProductModel> get allProducts => _allProducts;

  List<String> _headers = [];
  List<String> get headers => _headers;

  List<ProductModel> _favProducts = [];
  List<ProductModel> get favProducts => _favProducts;

  getHeaders() async {
    emit(GetHeadersLoadingState());
    try {
      http.Response requestResponse = await http.get(Uri.parse('${AppAssets.url}/headers.json'));
      if (requestResponse.statusCode == 200) {
        var responseData = json.decode(requestResponse.body);
        responseData.forEach((k, v) {
          _headers.add(v['imgUrl']);
        });
        emit(GetHeadersSuccessState());
      } else {
        emit(GetHeadersErrorState());
      }
    } catch (e) {
      emit(GetHeadersErrorState());
    }
  }

  getProducts() async {
    emit(GetProductsLoadingState());
    try {
      http.Response response = await http.get(Uri.parse('${AppAssets.url}/products.json'));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        responseData.forEach((key, value) {
          _allProducts.add(
            ProductModel(
              productId: key,
              productName: value['productName'],
              productDescription: value['productDescription'],
              productPrice: value['productPrice'],
              productImg: value['proudctImg'],
              categoryName: value['categoryId']
            )
          );
        });
        emit(GetProductsSuccessState());
      } else {
        emit(GetProductsErrorState());
      }
    } catch (e) {
      emit(GetProductsErrorState());
    }
  }

  handleFav(ProductModel product_model) {
    if (product_model.isFav == false) {
      product_model.isFav = true;
      _favProducts.add(product_model);
    } else {
      for (int i = 0; i < _favProducts.length; i++) {
        if (_favProducts[i].productId == product_model.productId) {
          _favProducts.removeAt(i);
          break;
        }
      }
      product_model.isFav = false;
    }
    emit(HandleFavState());
  }

  createProduct(String category, String title, String description, num price) async {
    emit(CreateProductLoadingState());
    try {
      Map<String, dynamic> data = {
        'productName': title,
        'productDescription': description,
        'productPrice': price,
        'categoryId': category,
        'proudctImg': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDIBxtZomfSTeVFkJqWN0itc6Q2FSomDWYnw&s'
      };
      http.Response response = await http.post(Uri.parse('${AppAssets.url}/products.json'), body: json.encode(data));
      if (response.statusCode == 200) {
        var jsonBody = json.decode(response.body);
        ProductModel newProduct = ProductModel(
          productId: jsonBody['name'],
          productName: title,
          productDescription: description,
          productPrice: price,
          productImg: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDIBxtZomfSTeVFkJqWN0itc6Q2FSomDWYnw&s',
          categoryName: category
        );
        _userProducts.add(newProduct);
        _allProducts.add(newProduct);
        emit(CreateProductSuccessState());
      } else {
        emit(CreateProductFailedState());
      }
    } catch (e) {
      emit(CreateProductFailedState());
    }
  }

  List<ProductModel> _filteredProducts = [];
  List<ProductModel> get filteredProducts => _filteredProducts;

  void filterCategory(String selectedCategory) {
    emit(FilterProductLoadingState());
    _filteredProducts.clear();
    for (ProductModel productModel in _allProducts) {
      if (productModel.categoryName == selectedCategory) {
        _filteredProducts.add(productModel);
      }
    }
    emit(FilterProductFinishState());
  }
}



/*


  1- Create a new object of cubit on top of material app
  2- create cubit & use emit each time we need to notify widget there an update happen
  3- create state & each state it means a chnage ( حاله ) happen  
  4- use BlocBuilder & BlocListener on the top widget that wants to listen to changes 


*/