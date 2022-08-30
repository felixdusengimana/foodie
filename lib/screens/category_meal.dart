import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String catTitle = '';
  List<Meal> catMeals = [];
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routerArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final catId = routerArgs['id'];
      catTitle = routerArgs['title'].toString();

      catMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      catMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
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
              removeItem: _removeMeal,
            );
          },
          itemCount: catMeals.length),
    );
  }
}
