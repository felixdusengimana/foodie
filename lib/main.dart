import 'package:flutter/material.dart';
import './screens/categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie',
      home: const CategoriesScreen(),
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleeway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline1: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
