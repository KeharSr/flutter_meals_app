import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/model/category_model.dart';
import 'package:meals_app/model/meals_model.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/categories_box.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<MealModel> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
      lowerBound: 0,
      upperBound: 1,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _selectedCategory(BuildContext context, CategoryModel category) {
    final List<MealModel> filteredCategory =
        widget.availableMeals
            .where((MealModel item) => item.categories.contains(category.id))
            .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (BuildContext context) =>
                MealsScreen(meals: filteredCategory, title: category.title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
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
      },
    );
  }
}
