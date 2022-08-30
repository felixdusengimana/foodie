import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routerName = "/filters";
  final Function setFilters;
  final Map<String, bool> currentFilters;
  // final Map<String, bool> currentFilters;

  FilterScreen(this.setFilters, this.currentFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian'] ?? false;
    _vegan = widget.currentFilters['vegan'] ?? false;
    _lactoseFree = widget.currentFilters['lactose'] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool value,
    Function onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(description),
      onChanged: onChanged as void Function(bool?),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.setFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  "Gluten-free",
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Lactose-free",
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  'Only include vegan meals.',
                  _vegan,
                  (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
