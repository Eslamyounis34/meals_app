import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/widgets/custom_loading.dart';
import 'package:meals_app/presentation/meals_screen/cubits/meal_screen_State.dart';
import 'package:meals_app/presentation/meals_screen/cubits/meal_screen_cubit.dart';
import 'package:meals_app/presentation/meals_screen/views/meals_item.dart';

class MealsListView extends StatelessWidget {
  const MealsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsCubit, MealsScreenState>(
      builder: (context, state) {
        if (state is MealsScreenSuccess) {
          return GridView.count(
            crossAxisCount: 2, // Set the number of columns to 2
            shrinkWrap: true,
            childAspectRatio: 1 / 1.3,
            physics: const NeverScrollableScrollPhysics(),
            children: state.meals.map((meal) => MealsItem(meal: meal)).toList(),
          );
        } else if (state is MealsScreenError) {
          return Center(child: Text(state.errMsg.toString()));
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}
