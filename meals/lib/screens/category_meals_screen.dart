//o que será mostrado na nova tela a partir de cada quadradinho/container
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where(
      (meal) =>  meal.categories.contains(category.id)
      ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) =>Text(categoryMeals[index].title),
      ),
    );
  }
}
