import 'package:dartz/dartz.dart';
import 'package:schooler_chat/core/networking/api_constants.dart';
import 'package:schooler_chat/core/networking/dio_helper.dart';
import 'package:schooler_chat/features/home/data/model/product_model.dart';

class HomeRepo {
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final res = await DioHelper.getData(
        endPoint: ApiConstants.getProductsEndpoint,
      );

      List<ProductModel> products = [];

      for (var product in res.data['products']) {
        products.add(ProductModel.fromJson(product));
      }
      return right(products);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
