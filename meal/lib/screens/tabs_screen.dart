import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/filter_screen.dart';
import 'package:meal/widgets/drawer_menu.dart';

import '../providers/favorites_provider.dart';
import '../providers/filters_provider.dart';
import '../providers/navbar_provider.dart';
import 'meals_screen.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableMeals = ref.watch(filteredMealsProvider);
    final selectedPageIndx = ref.watch(navBarProvider);
    Widget activePage = Categories(availableMeals: availableMeals);
    var activePageTitle = 'Categories';

    if (selectedPageIndx == 1) {
      final List<Meal> favoriteMeal = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeal,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: DrawerMenu(
        onSelectFilter: (String identifier) {
          Navigator.of(context).pop();
          if (identifier == 'filters') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const FilterScreen(),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navBarProvider.notifier).selectPage,
        currentIndex: selectedPageIndx,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), label: 'Categoreis'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
