import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<String, bool>>(
        (ref) => FilterNotifier());

class FilterNotifier extends StateNotifier<Map<String, bool>> {
  FilterNotifier()
      : super({
          "glutenFree": false,
          "lactoseFree": false,
          "vegan": false,
          "vegetarian": false,
        });
  
  void setFilters(Map<String, bool> chosenFilters){
     state = chosenFilters;
  }

  void setFilter(String key, bool value) {
    state = {
      ...state,
      key: value,
    };
  }
}

final filteredMealsProvider = Provider((ref) {
  final allMeals = ref.watch(mealsProvider);
  final activeMeals = ref.watch(filtersProvider);
   return allMeals.where((meal) {
      if(activeMeals["glutenFree"] == true && !meal.isGlutenFree){
        return false;
      }
      if(activeMeals["lactoseFree"] == true && !meal.isLactoseFree){
        return false;
      }
      if(activeMeals["vegan"] == true && !meal.isVegan){
        return false;
      }
      if(activeMeals["vegetarian"] == true && !meal.isVegetarian){
        return false;
      }
      
      return true;
    }).toList();
});
