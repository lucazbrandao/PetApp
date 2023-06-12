import 'package:petapp/model/pet_category_type.dart';

enum PetType {
  dog,
  cat,
  parrot,
  rabbit,
  fish,
  turtle,
}

enum PetGender {
  male,
  female,
}

extension PetTypeFilter on PetType {
  bool checkType(PetCategory petCategory) {
    if (petCategory == PetCategory.all) return true;

    switch (this) {
      case PetType.dog:
        return petCategory == PetCategory.dog;
      case PetType.cat:
        return petCategory == PetCategory.cat;
      case PetType.parrot:
        return petCategory == PetCategory.parrot;
      case PetType.rabbit:
        return petCategory == PetCategory.rabbit;
      case PetType.fish:
        return petCategory == PetCategory.fish;
      case PetType.turtle:
        return petCategory == PetCategory.turtle;
    }
  }
}
