import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settigns_screen.dart';
import 'screens/category_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';
import 'models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterVegan &&
            !filterVegetarian &&
            !filterLactose;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        // AppRoutes.HOME: (_) => CategoriesScreen(),
        AppRoutes.HOME: (_) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite,_isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => CategoriesScreen(),
      ),
    );
  }
}
