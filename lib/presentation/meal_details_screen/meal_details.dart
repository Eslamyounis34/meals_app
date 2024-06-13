import 'package:flutter/material.dart';
import 'package:meals_app/presentation/meal_details_screen/views/meals_details_body.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.mealID});

  final String mealID;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MealDetailsBody(),
    );
  }
}
