import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx/products/logic/product_cubit.dart';

Future<void> initDataMethod(BuildContext context) async {
  await BlocProvider.of<ProductCubit>(context).getProducts();
  await BlocProvider.of<ProductCubit>(context).getHeaders();
}