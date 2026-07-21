import 'package:flutter/material.dart';
import 'package:recipie_book/model/recipie_model.dart';

import '../strings/json_string.dart';

class RecipieProvider extends ChangeNotifier {
  final List<RecipieModel> _recipieList = [];

  List<RecipieModel> get recipieList =>
      List.unmodifiable(_recipieList);

  void loadRecipies() {
    final List<dynamic> recipeJsonList =
    recipeData['recipes'] as List<dynamic>;

    final List<RecipieModel> recipes = recipeJsonList
        .map(
          (item) => RecipieModel.fromJson(
        item as Map<String, dynamic>,
      ),
    )
        .toList();

    _recipieList
      ..clear()
      ..addAll(recipes);

    notifyListeners();
  }
}