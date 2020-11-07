import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ));
  }

  Widget buildContainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments;
    final Meal selectedMeal = DUMMY_MEALS.firstWhere((x) => mealId == x.id);

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(selectedMeal.ingredients[index])),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              )),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(selectedMeal.ingredients[index]),
                      ),
                      Divider()
                    ],
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ))
            ],
          ),
        ));
  }
}
