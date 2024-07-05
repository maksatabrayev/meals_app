import 'package:flutter/material.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';

const kInitialFilters = {
  "glutenFree" : false,
  "lactoseFree": false,
  "vegan"      : false,
  "vegetarian" : false,
};


class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedIndex = 0;

  void showMessageFav(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }



  void selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onSelectScreen(String selectedScreen) async {
    Navigator.of(context).pop();
    if (selectedScreen == "filters") {
     await Navigator.of(context).push<Map<String, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(filteredMeals: filteredMeals,);

    if (selectedIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
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
