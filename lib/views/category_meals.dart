import 'package:flutter/material.dart';
import 'package:hot_meal/model/categorie.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Category category = ModalRoute.of(context).settings.arguments;

    return Scaffold(
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
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 20,
                  offset: Offset(0, 0)
                )
              ]
            ),
            child: Center(
              child: Text(
                category.title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway",
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: size.height  * 0.1,)
        ],
      ),
    );
  }
}
