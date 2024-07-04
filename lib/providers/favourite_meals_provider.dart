import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal.dart';

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
        (ref) => FavouriteMealsNotifier());

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);
  // The medthod to handle adding and removing a meal to/from favMeals List
  bool toggleMealFavouriteStatus(Meal meal) {
    if (state.contains(meal)) {
      // Removing
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // Adding
      state = [...state, meal];
      return true;
    }
  }
}
