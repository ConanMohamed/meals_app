import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            value: activeFilters[Filter.vegan]!,
            onChanged: (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, value);
            },
          ),
          SwitchListTile(
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
          ),
        ],
      ),
    );
  }
}
