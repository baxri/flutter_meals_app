import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/': (_) => TabsScreen(),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (_) => MealDetailScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen(),
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('asdsad'),
        ),
        body: Text('Meals App'));
  }
}
