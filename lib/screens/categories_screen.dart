import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/model/category_model.dart';
import 'package:meals_app/model/meals_model.dart';

import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/categories_box.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onAddFavorite,
    required this.availableMeals,
  });

  final void Function(MealModel meals) onAddFavorite;

  final List<MealModel> availableMeals;

  void _selectedCategory(BuildContext context, CategoryModel category) {
    final List<MealModel> filteredCategory =
        availableMeals
            .where((MealModel item) => item.categories.contains(category.id))
            .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (BuildContext context) => MealsScreen(
              meals: filteredCategory,
              title: category.title,
              onAddFavorite: onAddFavorite,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: <Widget>[
        ...availableCategories.map((CategoryModel list) {
          return CategoriesBox(
            category: list,
            onSelectedCategory: () {
              _selectedCategory(context, list);
            },
          );
        }),
      ],
    );
  }
}
