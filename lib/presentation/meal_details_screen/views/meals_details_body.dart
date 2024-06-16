import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/domain/model/meal_details_response/meal_item.dart';
import 'package:meals_app/presentation/meal_details_screen/views/ingradient_item.dart';

class MealDetailsBody extends StatelessWidget {
  const MealDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://www.themealdb.com/images/media/meals/41cxjh1683207682.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Beef and Oyster Pie',
                        style: TextStyle(
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
                    itemCount: 10,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics:
                        const BouncingScrollPhysics(), // Assuming you have 10 ingredients
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 1),
                        child: IngradientItem(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
