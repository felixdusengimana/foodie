import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String id;
  // final String title;

  // const CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routerArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final catId = routerArgs['id'];
    final catTitle = routerArgs['title'];

    final catMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle!),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: Text(catMeals[index].title),
            );
          },
          itemCount: catMeals.length),
    );
  }
}
