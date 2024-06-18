import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/core/utils/assets.dart';
import 'package:meals_app/domain/model/meal_details_response/meal_item.dart';
import 'package:meals_app/presentation/meal_details_screen/views/ingradient_item.dart';
import 'package:meals_app/presentation/meal_details_screen/views/meal_desc_bottom_sheet.dart';

class MealDetailsSuccess extends StatelessWidget {
  const MealDetailsSuccess({super.key, required this.meal});

  final MealItem meal;

  @override
  Widget build(BuildContext context) {
    var ingredientsList = getIngredientsList();
    print('CheckList' + ingredientsList.toString());

    return Stack(
      // Use Stack for FAB positioning
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: meal.strMealThumb.toString(),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Image.asset(
                          AssetsData.youTubeLogo,
                          width: 75,
                          height: 75,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(meal.strMeal.toString(),
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                                  'NotoSansSundanese-Bold', // Replace with your font family name
                            ))),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.shortestSide < 600
                          ? 36.0
                          : 38.0, // Adjust breakpoint and heights
                      child: ListView.builder(
                        itemCount: ingredientsList.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics:
                            const BouncingScrollPhysics(), // Assuming you have 10 ingredients
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 1),
                            child: IngradientItem(
                              ingredientName: ingredientsList[index],
                            ), // Replace with your IngradientItem widget
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return MealBottomSheet(
                                      fullInstructionsString:
                                          meal.strInstructions.toString());
                                });
                          },
                          child: Text(
                            meal.strInstructions.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily:
                                    'assets/fonts/NotoSansSundanese-Medium.ttf'), // Replace with your font family
                            textAlign: TextAlign.center,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          // Position the FAB at bottom right
          bottom: 20.0,
          right: 20.0,
          child: FloatingActionButton(
            onPressed: () {
              // Your FAB action (e.g., navigate to another screen)
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return MealBottomSheet(
                        fullInstructionsString:
                            meal.strInstructions.toString());
                  });
            },
            child: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.black,
            ), // Replace with your desired icon
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  List getIngredientsList() {
    var ingredientsList = [];
    ingredientsList.add(meal.strIngredient1);
    ingredientsList.add(meal.strIngredient2);
    ingredientsList.add(meal.strIngredient3);
    ingredientsList.add(meal.strIngredient4);
    ingredientsList.add(meal.strIngredient5);
    ingredientsList.add(meal.strIngredient6);
    ingredientsList.add(meal.strIngredient7);

    return ingredientsList;
  }
}
