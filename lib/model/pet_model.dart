import 'package:petapp/model/pet_type.dart';

class PetModel {
  final int advId;
  final String name;
  final String race;
  final String age;
  final PetType type;
  final PetGender gender;
  final bool vaccinated;
  final String color;
  final String bioDescription;
  final List<String> images;

  const PetModel(
      {required this.advId,
      required this.name,
      required this.race,
      required this.age,
      required this.type,
      required this.gender,
      required this.vaccinated,
      required this.color,
      required this.bioDescription,
      required this.images});

  PetModel clone() => PetModel(
      advId: advId,
      name: name,
      race: race,
      age: age,
      type: type,
      gender: gender,
      vaccinated: vaccinated,
      color: color,
      bioDescription: bioDescription,
      images: images);
}

extension PetFilter on PetModel {
  String toFilter() {
    return '$name$race$age'.toLowerCase();
  }
}
