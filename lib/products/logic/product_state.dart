


abstract class ProductState {}

class InitState extends ProductState {}

class CreateProductSuccessState extends ProductState {}

class CreateProductFailedState extends ProductState {}

class CreateProductLoadingState extends ProductState {}

class GetProductsLoadingState extends ProductState {}

class GetProductsSuccessState extends ProductState {}

class GetProductsErrorState extends ProductState {}

class GetHeadersLoadingState extends ProductState {}

class GetHeadersSuccessState extends ProductState {}

class GetHeadersErrorState extends ProductState {}

class HandleFavState extends ProductState {}