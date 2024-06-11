import 'package:flutter/material.dart';
import 'package:meals_app/domain/model/category_response/category_data.dart';
import 'package:meals_app/presentation/categories_screen/views/category_item.dart';
import 'package:meals_app/presentation/meals_screen/views/meals_screen_body.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.category});

  final CategoryData category;
  @override
  Widget build(BuildContext context) {
    print('CategoryID $category');
    return Scaffold(
      body: MealsScreenBody(
        category: category,
      ),
    );
  }
}
