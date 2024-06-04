import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/features/categories_screen/categories_screen.dart';
import 'package:meals_app/features/meal_details_screen/meal_details.dart';
import 'package:meals_app/features/meals_screen/meals_screen.dart';

abstract class AppRouting {
  static const kCategories = '/categoriesScreen';
  static const kMealDetails = "/mealDetails";
  static const kMeals = "/mealsScreen";
  static final router = GoRouter(routes: [
    GoRoute(
      path: kCategories,
      builder: (context, state) => const CategoriesScreen(),
    ),
    GoRoute(
      path: kMeals,
      builder: (context, state) => const MealsScreen(),
    ),
    GoRoute(
      path: kMealDetails,
      builder: (context, state) => const MealDetailsScreen(),
    )
  ]);
}
