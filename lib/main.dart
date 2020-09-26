import 'package:flutter/material.dart';
import 'package:hot_meal/views/category_meals.dart';
import 'package:hot_meal/views/home_page.dart';
import 'package:hot_meal/views/meal_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hot Meals',
      theme: ThemeData(
        primaryColor: Colors.cyan[900],
        primaryColorLight: Colors.cyan[200],
        accentColor: Colors.pink[400],
        fontFamily: "Nunito",
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: "RobotoCondensed",
          )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomePage(),
      routes: {
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetail.routeName: (ctx) => MealDetail(),
      },
    );
  }
}

