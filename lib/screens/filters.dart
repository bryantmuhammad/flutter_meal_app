import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_switch.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() {
    return _FiltersState();
  }
}

class _FiltersState extends State<Filters> {
  bool _glutenFreeFilterSet = false;
  List<Map<String, dynamic>> filterList = [
    {
      'isChecked': false,
      'title': 'Gluten-free',
      'subtitle': 'Only include gluten-free meals'
    }
  ];

  void _toggleFilter(Map<String, dynamic> filter) {
    int filterIndex = filterList.indexWhere((element) => element == filter);

    setState(() {
      filterList[filterIndex]['isChecked'] =
          !filterList[filterIndex]['isChecked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          for (final filter in filterList)
            FilterSwitch(
              filter: filter,
              onToggleFilter: _toggleFilter,
            )
        ],
      ),
    );
  }
}
