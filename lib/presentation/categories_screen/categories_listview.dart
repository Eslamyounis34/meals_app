import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/presentation/categories_screen/category_item.dart';
import 'package:meals_app/presentation/categories_screen/cubits/categories_cubit.dart';
import 'package:meals_app/presentation/categories_screen/cubits/categories_state.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesScreenState>(
      builder: (context, state) {
        if (state is CategoriesScreenSuccess) {
          return ListView.builder(
            itemCount: state.categories.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var category = state.categories[index];
              return CategoryItem(category: category);
            },
            scrollDirection: Axis.vertical,
          );
        } else if (state is CategoriesScreenError) {
          return const Center(
              child: Text(
                  'Error loading categories')); // Return an error message widget
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        }
      },
    );
  }
}
