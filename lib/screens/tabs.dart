import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  "glutenFree" : false,
  "lactoseFree": false,
  "vegan"      : false,
  "vegetarian" : false,
};


class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  List<Meal> favouriteMeals = [];
  Map<String, bool> selectedFilters = kInitialFilters;

  void showMessageFav(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void toggleMealFavouriteStatus(Meal meal) {
    if (favouriteMeals.contains(meal)) {
      setState(() {
        favouriteMeals.remove(meal);
      });
      showMessageFav("Removed meal to favourites");
    } else {
      setState(() {
        favouriteMeals.add(meal);
      });
      showMessageFav("Added meal from favourites");
    }
  }

  void selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onSelectScreen(String selectedScreen) async {
    Navigator.of(context).pop();
    if (selectedScreen == "filters") {
     final result = await Navigator.of(context).push<Map<String, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(selectedFilters: selectedFilters),
        ),
      );
     // In case if it is null assign it to kInitialFilters
     setState(() {
       selectedFilters = result ?? kInitialFilters;
     });
     
    }
  }

  @override
  Widget build(BuildContext context) {
    // Checking the filters first :
    final filteredMeals = dummyMeals.where((meal) {
      if(selectedFilters["glutenFree"] == true && !meal.isGlutenFree){
        return false;
      }
      if(selectedFilters["lactoseFree"] == true && !meal.isLactoseFree){
        return false;
      }
      if(selectedFilters["vegan"] == true && !meal.isVegan){
        return false;
      }
      if(selectedFilters["vegetarian"] == true && !meal.isVegetarian){
        return false;
      }
      
      return true;
    }).toList();
    
    
    
    
    Widget activePage = CategoriesScreen(onToggleFavourite: toggleMealFavouriteStatus, filteredMeals: filteredMeals,);

    if (selectedIndex == 1) {
      activePage = MealsScreen(
        meals: favouriteMeals,
        onToggleFavourite: toggleMealFavouriteStatus,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex == 0 ? "Categories" : "Favourites"),
      ),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: onSelectScreen),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
        onTap: selectPage,
      ),
    );
  }
}
