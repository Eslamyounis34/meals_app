import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/utils/app_routing.dart';
import 'package:meals_app/core/utils/constants.dart';
import 'package:meals_app/domain/model/meals_response/meal.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouting.kMealDetails, extra: meal.idMeal);
        },
        child: Card(
          elevation: 10,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: meal.strMealThumb.toString(),
                  height: double.infinity,
                  fit: BoxFit.cover, // Adjust fit as needed
                ),
              ),
              Positioned(
                // Ensure it covers the entire bottom area
                bottom: 0.0,
                left: 0.0,
                right: 0.0, // Set right to 0.0 for full width
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 50.0, // Adjust height as needed
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          kPrimaryColor.withOpacity(1),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 5.0,
                left: 10.0,
                right: 5.0, // Adjust positioning as needed
                child: Text(
                  meal.strMeal.toString(),
                  maxLines: 2,
                  softWrap: true, // Allow wrapping within maxLines
                  overflow:
                      TextOverflow.ellipsis, // Handle overflow with ellipsis
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'NotoSansSundanese-Bold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
