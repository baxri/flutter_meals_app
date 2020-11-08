import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = './filters';

  final Map<String, bool> filters;
  final Function _setFilters;

  FiltersScreen(this._setFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutinFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutinFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];

    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool value, Function onChanged) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final filters = {
                  'gluten': _glutinFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };

                widget._setFilters(filters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection.',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.title)),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile('GLuten-free',
                  'Only includes GLuten-free meals!', _glutinFree, (val) {
                setState(() {
                  _glutinFree = val;
                });
              }),
              buildSwitchListTile(
                  'Vegetarian', 'Only includes Vegitarian meals!', _vegetarian,
                  (val) {
                setState(() {
                  _vegetarian = val;
                });
              }),
              buildSwitchListTile('Vegan', 'Only includes vegan meals!', _vegan,
                  (val) {
                setState(() {
                  _vegan = val;
                });
              }),
              buildSwitchListTile('Lactose-free',
                  'Only includes lactose-free meals!', _lactoseFree, (val) {
                setState(() {
                  _lactoseFree = val;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
