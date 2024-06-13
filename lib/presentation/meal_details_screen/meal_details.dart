import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/utils/service_locator.dart';
import 'package:meals_app/data/meals_repo_imbl.dart';
import 'package:meals_app/presentation/meal_details_screen/cubits/meal_details_cubit.dart';
import 'package:meals_app/presentation/meal_details_screen/views/meals_details_body.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.mealID});

  final String mealID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MealDetailsCubit(getIt.get<MealsRepositoryImbl>())
          ..fetchMealDetails(mealID),
        child: const MealDetailsBody(),
      ),
    );
  }
}
