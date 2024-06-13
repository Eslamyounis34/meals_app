import 'package:equatable/equatable.dart';
import 'package:meals_app/domain/model/meal_details_response/meal_item.dart';

abstract class MealDetailsStates extends Equatable {
  const MealDetailsStates();

  @override
  List<Object> get props => [];
}

class MealsDetailsInitial extends MealDetailsStates {}

class MealsDetailsLoading extends MealDetailsStates {}

class MealsDetailsError extends MealDetailsStates {
  final String errMsg;

  const MealsDetailsError(this.errMsg);
}

class MealsDetailsSuccess extends MealDetailsStates {
  final MealItem meal;
  const MealsDetailsSuccess(this.meal);
}
