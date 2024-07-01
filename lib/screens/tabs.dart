import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  List<Meal> favouriteMeals = [];

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

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        CategoriesScreen(onToggleFavourite: toggleMealFavouriteStatus);

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
