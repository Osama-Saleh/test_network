import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:netwrok/Cubit/home_cubit_state.dart';
import 'package:netwrok/model/product_model.dart';
import 'package:netwrok/network/http_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitState());
  static HomeCubit get(context) => BlocProvider.of(context);

  // ProductModel? productModel;
  List<ProductModel>? product;
  void getProducts() async {
    emit(ProductLoadingState());
    print("PostLoadingState");
    try {
      final value = await DioHelper.getData();
      print("value.data ${value.data}");

      var temp = value.data
          .map<ProductModel>(
            (item) => ProductModel.fromJson(item),
          )
          .toList();
      product = temp;
      print("product : ${product!.length}");
      print("product : ${product![0].id}");

      emit(ProductSuccsessgState());
      print("PostSuccsessgState");
    } catch (error) {
      emit(ProductErrorState());
      print("PostErrorState $error");
    }
  }
}