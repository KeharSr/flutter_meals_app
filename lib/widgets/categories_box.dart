import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/model/category_model.dart';
import 'package:meals_app/screens/meals_screen.dart';

class CategoriesBox extends StatelessWidget {
   CategoriesBox({super.key, required this.category,required this.onSelectedCategory});

  final CategoryModel category;

  VoidCallback  onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onSelectedCategory,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 30, 12, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: <Color>[category.color.withOpacity(0.2), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white60,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
