import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../screens/meal_detail_screen.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {

  void selectMeal(BuildContext context, String id) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((result) {
          setState(() {
            
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.favouriteMeals.isEmpty) {
      return Center(
      child: Text('You have no favourites yet'),
    );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: widget.favouriteMeals[index].id,
              title: widget.favouriteMeals[index].title,
              imageUrl: widget.favouriteMeals[index].imageUrl,
              affordability: widget.favouriteMeals[index].affordability,
              complexity: widget.favouriteMeals[index].complexity,
              duration: widget.favouriteMeals[index].duration,
              selectMeal: selectMeal,
            );
          },
          itemCount: widget.favouriteMeals.length,
        );
    }
    
  }
}
