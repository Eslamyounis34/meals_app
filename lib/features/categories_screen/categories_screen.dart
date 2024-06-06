import 'package:flutter/material.dart';
import 'package:meals_app/core/utils/styles.dart';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals_app/features/categories_screen/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
      ),
    );
  }
}
