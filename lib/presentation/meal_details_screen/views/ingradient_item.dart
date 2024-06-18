import 'package:flutter/material.dart';

class IngradientItem extends StatelessWidget {
  const IngradientItem({super.key, required this.ingredientName});
  final String ingredientName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(16),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ingredientName.toString(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
