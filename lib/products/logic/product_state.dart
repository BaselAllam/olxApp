


abstract class ProductState {}

class InitState extends ProductState {}

class CreateProductSuccessState extends ProductState {}

class CreateProductFailedState extends ProductState {}

class CreateProductLoadingState extends ProductState {}