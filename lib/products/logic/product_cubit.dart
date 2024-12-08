import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/products/logic/product_state.dart';


class ProductCubit extends Cubit<ProductState> {

  ProductCubit() : super(InitState());

  getProducts() {}

  handleFav() {}

  createProduct() async {
    emit(CreateProductLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(CreateProductSuccessState());
  }

  deleteProduct() {}

  editProduct() {}
}