import 'package:flutter/material.dart';

class MealBottomSheet extends StatelessWidget {
  const MealBottomSheet({super.key, required this.fullInstructionsString});

  final String fullInstructionsString;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Instructions',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'assets/fonts/NotoSansSundanese-Bold.ttf'),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(fullInstructionsString.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'assets/fonts/NotoSansSundanese-Medium.ttf'))
            ],
          ),
        ),
      ),
    );
  }
}
