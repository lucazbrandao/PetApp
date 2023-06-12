enum PetCategory {
  all,
  dog,
  cat,
  parrot,
  rabbit,
  fish,
  turtle,
}

class PetCategoryType {
  final PetCategory category;
  final String name;
  final String iconPath;

  const PetCategoryType(
      {required this.category, required this.name, required this.iconPath});
}
