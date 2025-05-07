import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/switch_list_title.dart';



class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key, });

 

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  bool _filterGluttenFree = false;
  bool _filterLactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    final activeFilters=ref.read(filtersProvider);
    _filterGluttenFree = activeFilters[Filter.glutenFree]!;
    _filterLactoseFree = activeFilters[Filter.lactoseFree]!;
    _vegetarian = activeFilters[Filter.vegetarian]!;
    _vegan = activeFilters[Filter.vegan]!;


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _filterGluttenFree,
            Filter.lactoseFree: _filterLactoseFree,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan,
          });
          if (didPop) return;
          Navigator.pop(context, <Filter, bool>{
            Filter.glutenFree: _filterGluttenFree,
            Filter.lactoseFree: _filterLactoseFree,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan,

          });

        },

        child: Column(
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
              value: _filterGluttenFree,
              onChanged: (bool isChecked) {
                setState(() {
                  _filterGluttenFree = isChecked;
                });
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
              value: _filterLactoseFree,
              onChanged: (bool isChecked) {
                setState(() {
                  _filterLactoseFree = isChecked;
                });
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
              value: _vegetarian,
              onChanged: (bool isChecked) {
                setState(() {
                  _vegetarian = isChecked;
                });
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
              value: _vegan,
              onChanged: (bool isChecked) {
                setState(() {
                  _vegan = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
