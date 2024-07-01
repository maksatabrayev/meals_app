import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.onToggleFavourite});
  
  final void Function(Meal meal) onToggleFavourite;
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isNotEmpty
        ? ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) => MealItem(meal: meals[index], onToggleFavourite: onToggleFavourite),
          )
        : Center(
            child: Text(
              "Oops seems like there are no meals!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          );

    return title == null
        ? content
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content);
  }
}
