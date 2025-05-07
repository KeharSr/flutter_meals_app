import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/items_drawer.dart';

import '../providers/filters_provider.dart';

Map<Filter, bool> kFilteredItems = <Filter, bool>{
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedIndex = 0;


  void _onSelectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.push<Map<Filter, bool>>(
        context,
         MaterialPageRoute(
          builder: (BuildContext context) {
            return const FilterScreen();
          },
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals=ref.watch(filterMealsProvider);

    Widget initialScreen = CategoriesScreen(
      
      availableMeals: filteredMeals,
    );
    String activePageTitle = 'Categories';

    final favoriteMeals = ref.watch(favoritesProvider);

    if (selectedIndex == 1) {
      initialScreen = MealsScreen(
        meals: favoriteMeals,
       
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
