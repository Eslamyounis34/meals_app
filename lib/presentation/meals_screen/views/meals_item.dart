import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: CachedNetworkImage(
          imageUrl:
              'https://www.themealdb.com/images/media/meals/1548772327.jpg'),
    );
  }
}
