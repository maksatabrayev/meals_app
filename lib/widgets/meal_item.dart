import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onToggleFavourite});
  

  String get affordabilityStr {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  String get complexityStr {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MealDetailsScreen(meal, onToggleFavourite: onToggleFavourite),
            ),
          );
        },
        splashColor: Theme.of(context).primaryColorLight,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            label: "${meal.duration} min",
                            iconData: Icons.schedule),
                        const SizedBox(width: 12),
                        MealItemTrait(
                            label: affordabilityStr,
                            iconData: Icons.attach_money),
                        const SizedBox(width: 12),
                        MealItemTrait(
                            label: complexityStr, iconData: Icons.food_bank),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
