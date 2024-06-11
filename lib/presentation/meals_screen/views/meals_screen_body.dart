import 'package:flutter/material.dart';
import 'package:meals_app/core/utils/constants.dart';
import 'package:meals_app/domain/model/category_response/category_data.dart';
import 'package:meals_app/presentation/categories_screen/views/category_item.dart';
import 'package:meals_app/presentation/meals_screen/views/meals_item.dart';

class MealsScreenBody extends StatelessWidget {
  const MealsScreenBody({super.key, required this.category});
  final CategoryData category;
  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Text("Meals",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        'NotoSansSundanese-Bold', // Replace with your font family name
                  )),
              SizedBox(
                height: 20,
              ),
              //  MealsItem()
            ],
          ),
        ));
  }
}
