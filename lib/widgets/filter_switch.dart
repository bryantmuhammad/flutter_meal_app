import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch({
    super.key,
    required this.filter,
    required this.onToggleFilter,
  });

  final Map<String, dynamic> filter;
  final void Function(Map<String, dynamic>) onToggleFilter;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filter['isChecked'],
      onChanged: (isChecked) {
        onToggleFilter(filter);
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
