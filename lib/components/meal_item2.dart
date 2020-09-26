import 'package:flutter/material.dart';
import 'package:hot_meal/model/meal.dart';
import 'package:hot_meal/model/meal_detail_args.dart';
import 'package:hot_meal/views/meal_detail.dart';

class MealItem2 extends StatelessWidget {
  const MealItem2({
    Key key,
    @required this.meal,
    @required this.color,
  }) : super(key: key);

  final Meal meal;
  final Color color;

  String get complexityText{
    switch (meal.complexity){
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
    }
  }
  String get affordabilityText{
    switch (meal.affordability){
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
    }
  }

  void _selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetail.routeName, arguments: MealDetailArgs(meal, color) );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin:
          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: InkWell(
            onTap: () {
              _selectMeal(context);
            },
            splashColor: color.withOpacity(.8),
            borderRadius: BorderRadius.circular(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(
                        meal.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.all(10),

                        width: constraints.maxWidth * 0.8,
                        child: Text(
                          meal.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 23),
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          // borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
                        ),
                      ),
                      bottom: 30,
                      right: 0,
                    )
                  ],
                ),
                Padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule),
                          SizedBox(width: 6,),
                          Text("${meal.duration} min")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(width: 6,),
                          Text(complexityText)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.attach_money),
                          SizedBox(width: 6,),
                          Text(affordabilityText)
                        ],
                      ),
                      !meal.isFavourite ? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: Theme.of(context).accentColor,),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}