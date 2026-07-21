import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipie_book/providers/recipie_provider.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecipieProvider()..loadRecipies(),
      child: const _RecipeView(),
    );
  }
}

class _RecipeView extends StatelessWidget {
  const _RecipeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Recipe',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<RecipieProvider>(
        builder: (context, recipieProvider, child) {
          if (recipieProvider.recipieList.isEmpty) {
            return const Center(
              child: Text('No recipes found'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: recipieProvider.recipieList.length,

            itemBuilder: (context, index) {
              final recipe =
              recipieProvider.recipieList[index];

              return Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.emoji_food_beverage_rounded),
                  ),
                  title: Text(
                    recipe.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(recipe.description),
                      const SizedBox(height: 6),
                      Text(
                        'Ingredients: ${recipe.ingredients.join(', ')}',
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}