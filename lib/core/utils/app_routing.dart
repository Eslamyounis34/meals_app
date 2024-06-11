import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/domain/model/category_response/category_data.dart';
import 'package:meals_app/presentation/categories_screen/categories_screen.dart';
import 'package:meals_app/presentation/categories_screen/views/category_item.dart';
import 'package:meals_app/presentation/meal_details_screen/meal_details.dart';
import 'package:meals_app/presentation/meals_screen/meals_screen.dart';

abstract class AppRouting {
  static const kCategories = '/categoriesScreen';
  static const kMealDetails = "/mealDetails";
  static const kMeals = "/mealsScreen";
  static final router = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const CategoriesScreen(),
    ),
    GoRoute(
        path: kMeals,
        builder: (context, state) {
          CategoryData categoryItem = state.extra as CategoryData;
          return MealsScreen(category: categoryItem);
        }),
    GoRoute(
      path: kMealDetails,
      builder: (context, state) => const MealDetailsScreen(),
    )
  ]);
}
