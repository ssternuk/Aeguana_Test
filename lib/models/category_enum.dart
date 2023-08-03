// ignore_for_file: constant_identifier_names

enum Category { Unknown, Meals, Drinks, Snacks, Sweets }

Category getEnumFromString(String value) {
  switch (value) {
    case 'Drinks':
      return Category.Drinks;
    case 'Snacks':
      return Category.Snacks;
    case 'Sweets':
      return Category.Sweets;
    case 'Small Meal':
      return Category.Meals;
    default:
      return Category.Unknown;
  }
}
