import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust corner radius
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          CachedNetworkImage(
            imageUrl: 'https://www.themealdb.com/images/category/beef.png',
            height: 100,
            width: 100,
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            'Beef',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'assets/fonts/NotoSansSundanese-Bold.ttf'),
          )
        ],
      ),
    );
  }
}
