import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favourites_screen.dart';

import '../models/meal.dart';

import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> screens;

  int _selectedScreenIndex = 0;

  @override
  void initState() {
    screens = [CategoriesScreen(), FavouritesScreen(widget.favouriteMeals)];
    super.initState();
  }

  void _selectPage(index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
              label: 'Categories', icon: Icon(Icons.category)),
          BottomNavigationBarItem(label: 'Favourites', icon: Icon(Icons.star))
        ],
      ),
    );
  }
}
