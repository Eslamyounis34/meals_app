import 'package:flutter/material.dart';

class IngradientItem extends StatelessWidget {
  const IngradientItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(16),
        child: Container(
          color: Colors.grey,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Burger Rebuplic',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
