import 'package:flutter/material.dart';
import 'package:hot_meal/model/meal.dart';
import 'package:hot_meal/model/meal_detail_args.dart';
import 'package:hot_meal/views/meal_detail.dart';

class MealItem extends StatelessWidget {
  const MealItem({
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
    Navigator.of(ctx).pushNamed(MealDetail.routeName, arguments: MealDetailArgs(meal, color));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        elevation: 0,
        child:InkWell(
          borderRadius: BorderRadius.circular(30),
          splashColor: color.withOpacity(.3),
          child:  ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(meal.imageUrl),
                    fit: BoxFit.fill
                ),
              ),
            ),
            title: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(meal.title, textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            ),
            subtitle: Row(
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
              ],
            ),
            trailing: Column(
              children: [
                Spacer(),
                !meal.isFavourite ? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: Theme.of(context).accentColor,),
                Spacer()
              ],
            ),
          ),
          onTap: (){
            _selectMeal(context);
          },
        ),
      ),
    );
  }
}