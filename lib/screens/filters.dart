import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_switch.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Map<String, dynamic>> kInitialFilterList = [
  {
    'isChecked': false,
    'title': 'Gluten-free',
    'subtitle': 'Only include gluten-free meals',
    'filter': Filter.glutenFree
  },
  {
    'isChecked': false,
    'title': 'Lactose-free',
    'subtitle': 'Only include lactose-free meals',
    'filter': Filter.lactoseFree
  },
  {
    'isChecked': false,
    'title': 'Vegetarian',
    'subtitle': 'Only include vegetarian meals',
    'filter': Filter.vegetarian
  },
  {
    'isChecked': false,
    'title': 'Vegan',
    'subtitle': 'Only include vegan meals',
    'filter': Filter.vegan
  }
];

class Filters extends ConsumerWidget {
  const Filters({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterList = kInitialFilterList;
    final currentFilters = ref.watch(filtersProvider);

    currentFilters.forEach((key, value) {
      int filterIndex =
          filterList.indexWhere((filter) => filter['filter'] == key);

      filterList[filterIndex]['isChecked'] = value;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          for (final filter in filterList)
            FilterSwitch(
              filter: filter,
            )
        ],
      ),
    );
  }
}
