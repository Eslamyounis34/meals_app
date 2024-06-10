import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/utils/constants.dart';
import 'package:meals_app/domain/model/category_response/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        elevation: 10,
        color: kBlackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust corner radius
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            CachedNetworkImage(
              imageUrl: category.strCategoryThumb.toString(),
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              category.strCategory.toString(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'assets/fonts/NotoSansSundanese-Bold.ttf'),
            )
          ],
        ),
      ),
    );
  }
}
