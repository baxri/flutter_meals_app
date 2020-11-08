import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

import './models/meal.dart';

import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;
      availableMeals = DUMMY_MEALS.where((Meal meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  // TO DO
  // void _toggleFavorite(String mealId) {
  //   final index = favouriteMeals.indexWhere((element) => mealId == element.id);

  //   if (index > -1) {
  //     setState(() {
  //       favouriteMeals.removeAt(index);
  //     });
  //   } else {
  //     setState(() {
  //       favouriteMeals
  //           .add(DUMMY_MEALS.firstWhere((element) => mealId == element.id));
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
              // ignore: deprecated_member_use
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              // ignore: deprecated_member_use
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)))),
      initialRoute: '/', //optional
      routes: {
        '/': (_) => TabsScreen(favouriteMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen(_setFilters, filters),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
