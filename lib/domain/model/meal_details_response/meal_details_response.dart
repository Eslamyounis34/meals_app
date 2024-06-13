import 'package:equatable/equatable.dart';

import 'meal_item.dart';

class MealDetailsResponse extends Equatable {
  final List<MealItem>? meals;

  const MealDetailsResponse({this.meals});

  factory MealDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MealDetailsResponse(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => MealItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'meals': meals?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [meals];
}
