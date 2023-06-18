import 'package:petapp/model/pet_type.dart';

class UserPetAdoptionModel {
  final int advId;
  final String name;
  final String race;
  final PetType type;

  UserPetAdoptionModel({
    required this.advId,
    required this.name,
    required this.race,
    required this.type,
  });
}
