import 'package:flutter/material.dart';
import 'package:hot_meal/components/meal_item.dart';
import 'package:hot_meal/components/meal_item2.dart';
import 'package:hot_meal/data/dummy.dart';
import 'package:hot_meal/model/categorie.dart';
import 'package:hot_meal/model/meal.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    Category category = ModalRoute.of(context).settings.arguments;

    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(category.id))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: category.color,
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.15,
            padding: EdgeInsets.only(bottom: 40),
            width: double.infinity,
            decoration: BoxDecoration(
                color: category.color,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 20,
                      offset: Offset(0, 0))
                ]),
            child: Column(
              children: [
                Text(
                  category.title,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway",
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.list,
                      color: Colors.white,
                      size: 25,
                    ),
                    Text(
                      "Total: ${categoryMeals.length}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                // return MealItem(meal: categoryMeals[index], color: category.color);
                return orientation == Orientation.portrait ?
                        MealItem2(meal: categoryMeals[index], color: category.color): MealItem(meal: categoryMeals[index], color: category.color);
              },
              itemCount: categoryMeals.length,
            ),
          )
        ],
      ),
    );
  }
}


