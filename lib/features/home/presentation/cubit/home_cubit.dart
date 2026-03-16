import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schooler_chat/features/home/data/model/product_model.dart';
import 'package:schooler_chat/features/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.dio) : super(HomeInitialState());

  final Dio dio;

  Future<void> fetchProducts() async {
    emit(HomeLoadingState());

    try {
      final res = await dio.get('https://dummyjson.com/products');

      List<ProductModel> products = [];

      for (var product in res.data['products']) {
        products.add(ProductModel.fromJson(product));
      }
      if (res.statusCode == 200) {
        emit(HomeSuccessState(products: products));
      } else {
        emit(HomeFailureState(errMessage: 'error with status code'));
      }
    } catch (e) {
      emit(HomeFailureState(errMessage: e.toString()));
    }
  }
}
