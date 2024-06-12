import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/utils/service_locator.dart';
import 'package:meals_app/data/meals_repo_imbl.dart';
import 'package:meals_app/domain/model/category_response/category_data.dart';
import 'package:meals_app/presentation/categories_screen/views/category_item.dart';
import 'package:meals_app/presentation/meals_screen/cubits/meal_screen_cubit.dart';
import 'package:meals_app/presentation/meals_screen/views/meals_screen_body.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.category});

  final CategoryData category;
  @override
  Widget build(BuildContext context) {
    print('CategoryID $category');
    return Scaffold(
      body: BlocProvider(
        create: (context) => MealsCubit(getIt.get<MealsRepositoryImbl>())
          ..getMeals(category.strCategory.toString()),
        child: MealsScreenBody(
          category: category,
        ),
      ),
    );
  }
}
