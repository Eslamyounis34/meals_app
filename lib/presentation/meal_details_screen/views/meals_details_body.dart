import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/core/widgets/custom_loading.dart';
import 'package:meals_app/domain/model/meal_details_response/meal_item.dart';
import 'package:meals_app/presentation/meal_details_screen/cubits/meal_details_cubit.dart';
import 'package:meals_app/presentation/meal_details_screen/cubits/meal_details_states.dart';
import 'package:meals_app/presentation/meal_details_screen/views/ingradient_item.dart';
import 'package:meals_app/presentation/meal_details_screen/views/meal_desc_bottom_sheet.dart';
import 'package:meals_app/presentation/meal_details_screen/views/meal_details_success_screen.dart';

class MealDetailsBody extends StatelessWidget {
  const MealDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDetailsCubit, MealDetailsStates>(
      builder: (context, state) {
        if (state is MealsDetailsSuccess) {
          return MealDetailsSuccess(
            meal: state.meal,
          );
        } else if (state is MealsDetailsError) {
          return Center(child: Text(state.errMsg.toString()));
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}
