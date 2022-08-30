import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String id;
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
            return MealItem(
              id: catMeals[index].id,
              title: catMeals[index].title,
              imageUrl: catMeals[index].imageUrl,
              duration: catMeals[index].duration,
              complexity: catMeals[index].complexity,
              affordability: catMeals[index].affordability,
              removeItem: () {},
            );
          },
          itemCount: catMeals.length),
    );
  }
}
