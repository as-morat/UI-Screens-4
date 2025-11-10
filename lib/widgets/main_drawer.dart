import 'package:flutter/material.dart';
import 'package:meals/main.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String title) onSelect;

  const MainDrawer({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final them = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  them.colorScheme.primaryContainer,
                  them.colorScheme.primaryContainer.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  size: 45,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  "Cooking Up!",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant, size: 26, color: theme.colorScheme.primary),
            title: Text(
              "Meals",
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            onTap: () => onSelect("meals"),
          ),
          ListTile(
            leading: Icon(Icons.sort, size: 26, color: theme.colorScheme.primary),
            title: Text(
              "Filters",
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            onTap: () => onSelect("filters"),
          )
        ],
      ),
    );
  }
}
