import 'package:equatable/equatable.dart';

import 'meal.dart';

class MealsResponse extends Equatable {
  final List<Meal>? meals;

  const MealsResponse({this.meals});

  factory MealsResponse.fromJson(Map<String, dynamic> json) => MealsResponse(
        meals: (json['meals'] as List<dynamic>?)
            ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'meals': meals?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [meals];
}
