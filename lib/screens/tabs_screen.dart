import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/model/meals_model.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/items_drawer.dart';

Map<Filter, bool> kFilteredItems = <Filter, bool>{
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;

  Map<Filter, bool> _selectedFilters = kFilteredItems;

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  final List<MealModel> _favouriteMeals = <MealModel>[];

  void addOrRemoveMeals(MealModel meals) {
    final bool exist = _favouriteMeals.contains(meals);

    if (exist) {
      setState(() {
        _favouriteMeals.remove(meals);
        showInfoMessage('Meals Removed');
      });
    } else {
      setState(() {
        _favouriteMeals.add(meals);
        showInfoMessage('Meals Added');
      });
    }
  }

  void _onSelectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final Map<Filter, bool>? result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return FilterScreen(selectedFilters: _selectedFilters);
          },
        ),
      );
      setState(() {
        _selectedFilters = result ?? kFilteredItems;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<MealModel> filteredItems =
        dummyMeals.where((MealModel meal) {
          if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
            return false;
          }

          if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
            return false;
          }

          if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
            return false;
          }

          if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
            return false;
          }
          return true;
        }).toList();

    Widget initialScreen = CategoriesScreen(
      onAddFavorite: addOrRemoveMeals,
      availableMeals: filteredItems,
    );
    String activePageTitle = 'Categories';

    if (selectedIndex == 1) {
      initialScreen = MealsScreen(
        meals: _favouriteMeals,
        onAddFavorite: addOrRemoveMeals,
      );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: ItemsDrawer(onSelectScreen: _onSelectScreen),
      body: initialScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
