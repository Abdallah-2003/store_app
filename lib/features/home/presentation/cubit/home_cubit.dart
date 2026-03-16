import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schooler_chat/features/home/data/repo/home_repo.dart';
import 'package:schooler_chat/features/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitialState());


  Future<void> fetchProducts() async {
    emit(HomeLoadingState());

    try {
      final res = await homeRepo.getProducts();
      res.fold(
      (error) {
        emit(HomeFailureState(errMessage: error));
      }, (products) {
        emit(HomeSuccessState(products: products));
      },
    );
    } catch (e) {
      emit(HomeFailureState(errMessage: e.toString()));
    }
  }
}
