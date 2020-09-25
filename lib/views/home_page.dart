import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hot_meal/components/category_item.dart';
import 'package:hot_meal/data/dummy.dart';
import 'package:hot_meal/views/category_meals.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        children: DUMMY_CATEGORIES.map((cat) => CategoryItem(catergory: cat,)).toList(),
      )
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg", color: Colors.white, height: 30,),
        onPressed: () {},
      ),
      title: Row(
        children: [
          SvgPicture.asset("assets/icons/lunch-box.svg", height: 30,),
          SizedBox(width: 5,),
          Text("Hot Meal", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
        ],
      ),
    );
  }
}
