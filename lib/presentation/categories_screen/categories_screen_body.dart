import 'package:flutter/material.dart';
import 'package:meals_app/presentation/categories_screen/category_item.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Categories",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'NotoSansSundanese-Bold', // Replace with your font family name
                    )),
                const SizedBox(height: 25),
                ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const CategoryItem(),
                  scrollDirection: Axis.vertical,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
