import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meals_model.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealsDetailScreen extends ConsumerWidget {
  const MealsDetailScreen({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final bool isAdded = ref
                  .read(favoritesProvider.notifier)
                  .toggleFavoritesStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(isAdded ? 'Added' : 'Removed')),
              );
            },

            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            Text(
              'Ingredients',

              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: const Color.fromARGB(255, 216, 115, 14),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // ...meal.ingredients.map((String item) {
            //   return Text(item.toString());
            // }),     // one of the step to loop over the list of ingredients is map

            //another method
            for (final String items in meal.ingredients)
              Text(
                textAlign: TextAlign.center,
                items,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            const SizedBox(height: 12),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: const Color.fromARGB(255, 216, 115, 14),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...meal.steps.map((String item) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 7,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  item,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
