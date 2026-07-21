class RecipieModel {
  final String title;
  final String description;
  final List<String> ingredients;

  const RecipieModel({
    required this.title,
    required this.description,
    required this.ingredients,
  });

  factory RecipieModel.fromJson(Map<String, dynamic> json) {
    return RecipieModel(
      title: json['title'] as String,
      description: json['description'] as String,
      ingredients: List<String>.from(
        json['ingredients'] as List,
      ),
    );
  }
}