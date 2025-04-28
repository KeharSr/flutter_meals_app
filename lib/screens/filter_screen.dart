import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/widgets/items_drawer.dart';
import 'package:meals_app/widgets/switch_list_title.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.selectedFilters});

  final Map<Filter, bool> selectedFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _filterGluttenFree = false;
  bool _filterLactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  void _onSelectScreen(String identifier) {
    Navigator.pop(context);

    if (identifier == 'meals') {
      Navigator.pop(context, <Filter, bool>{
        Filter.glutenFree: _filterGluttenFree,
        Filter.lactoseFree: _filterLactoseFree,
        Filter.vegetarian: _vegetarian,
        Filter.vegan: _vegan,
      });

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (BuildContext context) {
      //       return const TabsScreen();
      //     },
      //   ),
      // );
    }
  }

  @override
  void initState() {
    _filterGluttenFree = widget.selectedFilters[Filter.glutenFree]!;
    _filterLactoseFree = widget.selectedFilters[Filter.lactoseFree]!;
    _vegetarian = widget.selectedFilters[Filter.vegetarian]!;
    _vegan = widget.selectedFilters[Filter.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      drawer: ItemsDrawer(onSelectScreen: _onSelectScreen),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
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
