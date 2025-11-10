import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavourite;

  const MealScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavourite,
  });

  void selectMeal(BuildContext context, Meal meal) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MealDetailsScreen(
            meal: meal,
            onToggleFavourite: onToggleFavourite,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return MealItem(
          meal: meal,
          onSelectMeal: (meal) => selectMeal(context, meal),
        );
      },
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh oh ... nothing here!",
              style: theme.textTheme.headlineLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Try selecting a different category!",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    if (title == null) return content;

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
