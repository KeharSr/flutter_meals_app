import 'package:flutter/material.dart';

class ItemsDrawer extends StatelessWidget {
  const ItemsDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      elevation: 2,

      child: Column(
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(20),

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromARGB(255, 227, 132, 49),
                  Color.fromARGB(255, 240, 94, 94),
                ],
              ),
            ),
            child: Row(
              children: <Widget>[
                const Icon(Icons.fastfood, size: 48, color: Colors.red),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up...',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color.fromARGB(255, 2, 64, 139),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Meals', style: Theme.of(context).textTheme.titleLarge),
            leading: const Icon(
              Icons.restaurant,
              size: 26,
              color: Colors.amber,
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          const SizedBox(height: 24),
          ListTile(
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            leading: const Icon(Icons.settings, size: 26, color: Colors.amber),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
