import 'package:flutter/material.dart';
import 'package:meals_app/presentation/categories_screen/views/categories_listview.dart';
import 'package:meals_app/presentation/categories_screen/views/category_item.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Categories",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'NotoSansSundanese-Bold', // Replace with your font family name
                    )),
                SizedBox(height: 25),
                CategoriesListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
