import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/domain/meals_repository.dart';
import 'package:meals_app/presentation/meal_details_screen/cubits/meal_details_states.dart';

class MealDetailsCubit extends Cubit<MealDetailsStates> {
  MealDetailsCubit(this.mealsRepo) : super(MealsDetailsInitial());

  final MealsRepository mealsRepo;

  Future<void> fetchMealDetails(String mealID) async {
    emit(MealsDetailsLoading());
    var response = await mealsRepo.fetchMealDetails(mealID);

    response.fold((error) {
      print('Details Error $error');
      emit(MealsDetailsError(error.toString()));
    }, (mealDetails) {
      print('Details Success $mealDetails');
      emit(MealsDetailsSuccess(mealDetails));
    });
  }
}
