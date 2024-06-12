import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/domain/meals_repository.dart';
import 'package:meals_app/presentation/meals_screen/cubits/meal_screen_State.dart';

class MealsCubit extends Cubit<MealsScreenState> {
  MealsCubit(this.mealsRepo) : super(MealsScreenInitial());
  final MealsRepository mealsRepo;

  Future<void> getMeals(String category) async {
    emit(MealsScreenInitial());

    var data = await mealsRepo.fetchSelectedCategoryMeals(category);
    data.fold((error) {
      print('dataError :$data');
      emit(MealsScreenError(error.toString()));
    }, (mealsList) {
      print('data :$data');
      emit(MealsScreenSuccess(mealsList));
    });
  }
}
