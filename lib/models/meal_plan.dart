class MealPlan {
  final String id;
  final String name;
  final String description;
  final String type; // 'Veg' or 'Non-Veg'
  final String category; // 'Standard' or 'Premium'
  final double price;
  final String imageUrl;
  final List<String> menuItems;

  MealPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.menuItems,
  });

  // Convert to Map for storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
      'menuItems': menuItems,
    };
  }

  // Create from Map
  factory MealPlan.fromMap(Map<String, dynamic> map) {
    return MealPlan(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? '',
      category: map['category'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      imageUrl: map['imageUrl'] ?? '',
      menuItems: List<String>.from(map['menuItems'] ?? []),
    );
  }
}
