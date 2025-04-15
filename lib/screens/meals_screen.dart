import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/model/meals_model.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, required this.meals, required this.title});

  final String title;
  List<MealModel> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(meals[index].title);
      },
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Ops nothing here',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Colors.white),
            ),
            Text(
              'Keep Exploring other products as well',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Colors.white),
            ),
          ],
        ),
      );
    }
    return Scaffold(appBar: AppBar(title: Text(title)), body: content);
  }
}
