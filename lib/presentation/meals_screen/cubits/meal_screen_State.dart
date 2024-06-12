import 'package:equatable/equatable.dart';
import 'package:meals_app/domain/model/meals_response/meal.dart';

abstract class MealsScreenState extends Equatable {
  const MealsScreenState();

  @override
  List<Object> get props => [];
}

class MealsScreenInitial extends MealsScreenState {}

class MealsScreenLoading extends MealsScreenState {}

class MealsScreenError extends MealsScreenState {
  final String errMsg;

  const MealsScreenError(this.errMsg);
}

class MealsScreenSuccess extends MealsScreenState {
  final List<Meal> meals;

  const MealsScreenSuccess(this.meals);
}
