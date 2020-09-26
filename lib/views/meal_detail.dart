import 'package:flutter/material.dart';
import 'package:hot_meal/model/meal.dart';
import 'package:hot_meal/model/meal_detail_args.dart';

class MealDetail extends StatefulWidget {
  static const routeName = "/meal-detaail";

  @override
  _MealDetailState createState() => _MealDetailState();
}


class _MealDetailState extends State<MealDetail> {

  String _complexityText(Complexity complexity) {
    switch (complexity) {
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
  String _affordabilityText(Affordability affordability) {
    switch (affordability) {
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

  @override
  Widget build(BuildContext context) {

    MealDetailArgs parameters = ModalRoute.of(context).settings.arguments;
    Meal meal = parameters.meal;
    Color color = parameters.color;
    Size size = MediaQuery.of(context).size;
    double statusBarHeigh = MediaQuery.of(context).padding.top;
    AppBar appBar = AppBar(
      backgroundColor: color,
      elevation: 0,
      actions: [
        !meal.isFavourite
            ? IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
        )
            : IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite),
        )
      ],
    );
    double rawHeight = size.height - appBar.preferredSize.height - statusBarHeigh;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: appBar,
      body: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(meal.imageUrl),
                      ),
                    ),
                    height: rawHeight * .3,
                  ),
                  Container(
                    height: rawHeight * .3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topCenter,
                            colors: [color.withOpacity(.1), color],
                            stops: [0.0, 1.0])
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            width: size.width * .7,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Text(
                                meal.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.schedule,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "${meal.duration} min",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.work, color: Colors.white),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(_complexityText(meal.complexity),
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.attach_money,
                                        color: Colors.white),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(_affordabilityText(meal.affordability),
                                        style: TextStyle(color: Colors.white))
                                  ],
                                )
                              ],
                            ),
                            padding: EdgeInsets.all(20),
                          )
                        ],
                      )),
                ],
              )),
          LayoutBuilder(builder: (ctx, constraints){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
              height: rawHeight * .7 ,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //todo ingredients
                    Container(
                      height: (rawHeight * .7) * .5,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              Icon(Icons.timelapse),
                              SizedBox(width: 7,),
                              Text("Ingredients", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Spacer(),
                            ],
                          ),
                          Expanded(
                            child: ListView(
                              children: meal.ingredients.map((ing) => ListTile(
                                title: Text(ing),
                                focusColor: color,

                              )).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    //todo steps
                    SizedBox(height: 20,),
                    Container(
                      height: (rawHeight * .7) * .5,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              Icon(Icons.format_list_numbered),
                              Text("Steps", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Spacer()
                            ],
                          ),
                          Expanded(
                            child: ListView(
                              children: meal.ingredients.map((ing) => ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: color,
                                  child: Text((meal.ingredients.indexOf(ing) + 1).toString()),
                                ),
                                title: Text(ing),
                                focusColor: color,
                              )).toList(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },)
        ],
      ),
    );
  }


}
