import 'package:flutter/material.dart';
import 'package:hot_meal/model/categorie.dart';
import 'package:hot_meal/views/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final Category catergory;

  CategoryItem({this.catergory});

  void _selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMeals.routeName, arguments: catergory);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {_selectCategory(context);},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [catergory.color.withOpacity(.7), catergory.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        height: 40,
        padding: EdgeInsets.all(15),
        child: Center(
            child: FittedBox(
          child: Text(
            catergory.title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )),
      ),
    );
  }
}
