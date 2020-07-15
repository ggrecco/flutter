//o que será mostrado na nova tela a partir de cada quadradinho/container
import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {

  // final Category category;

  // const CategoryMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Receitas por Categoria...\nID: ${category.id}\nTITLE: ${category.title}'),
      ),
    );
  }
}
