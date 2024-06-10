import 'package:bloc/bloc.dart';
import 'package:meals_app/domain/meals_repository.dart';
import 'package:meals_app/presentation/categories_screen/categories_screen.dart';
import 'package:meals_app/presentation/categories_screen/cubits/categories_state.dart';
import 'package:toast/toast.dart';

class CategoriesCubit extends Cubit<CategoriesScreenState> {
  CategoriesCubit(this.mealsRepo) : super(CategoriesScreenInitial());
  final MealsRepository mealsRepo;

  Future<void> getCategoriesItems() async {
    emit(CategoriesScreenLoading());
    print('respnse Loading');

    var response = await mealsRepo.fetchMealCategories();

    response.fold((failure) {
      print('respnseError :$response');
      emit(CategoriesScreenError('$failure'));
    }, (categories) {
      print('respnseSuccess :$response');
      emit(CategoriesScreenSuccess(categories));
    });
  }
}
