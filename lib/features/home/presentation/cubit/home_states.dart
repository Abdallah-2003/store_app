
import 'package:schooler_chat/features/home/data/model/product_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeFailureState extends HomeState{
  final String errMessage;
  HomeFailureState({required this.errMessage});
}
class HomeSuccessState extends HomeState{
  final List<ProductModel> products;
  HomeSuccessState({required this.products}); 
}