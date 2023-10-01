import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterSwitch extends ConsumerWidget {
  const FilterSwitch({
    super.key,
    required this.filter,
  });

  final Map<String, dynamic> filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      value: filter['isChecked'],
      onChanged: (isChecked) {
        ref
            .read(filtersProvider.notifier)
            .setFilter(filter['filter'], isChecked);
      },
      title: Text(
        filter['title'],
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        filter['subtitle'],
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
