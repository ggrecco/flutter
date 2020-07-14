// constroi o grid com as caixinhas lado a lado
import 'package:flutter/material.dart';
import 'package:meals/components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  //passa cada elemento de DUMMY para CategoryItem(laço for)
  final elementos = DUMMY_CATEGORIES.map((cat) => CategoryItem(cat)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos Cozinhar'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: elementos,
      ),
    );
  }
}
