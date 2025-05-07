import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/switch_list_title.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key, });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters=ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body:  Column(
          children: <Widget>[
            KSwitchTile(
              title: Text(
                'GluttenFree',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'This includes only gluteenfree meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 20),
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (bool isChecked) {

                  ref.read(filtersProvider.notifier).filter(Filter.glutenFree, isChecked);

              },
            ),
            KSwitchTile(
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'This includes only lactose-free meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 20),
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (bool isChecked) {

                  ref.read(filtersProvider.notifier).filter(Filter.lactoseFree, isChecked);

              },
            ),
            KSwitchTile(
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'This includes only vegetarian meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 20),
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (bool isChecked) {
                ref.read(filtersProvider.notifier).filter(Filter.vegetarian, isChecked);
              },
            ),
            KSwitchTile(
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'This includes only vegan meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 20),
              value: activeFilters[Filter.vegan]!,
              onChanged: (bool isChecked) {
                ref.read(filtersProvider.notifier).filter(Filter.vegan, isChecked);
              },
            ),
          ],
        ),
    );
  }
}
