import 'package:flutter/cupertino.dart';

class RegisterPetBottomSheetController {
  final TextEditingController petNameTextController = TextEditingController();
  final TextEditingController petRaceTextController = TextEditingController();
  final TextEditingController petBioTextController = TextEditingController();
  final TextEditingController petAgeTextController = TextEditingController();
  final TextEditingController petColorTextController = TextEditingController();
  final TextEditingController ownerBioTextController = TextEditingController();
  final TextEditingController ownerSocialMediaTextController =
      TextEditingController();
  String petGender = '';
  String petVaccinated = '';
  String petCategory = '';

  void submiteForm() {
    var registerJson = {
      'petName': petNameTextController.text,
      'petRace': petRaceTextController.text,
      'petBio': petBioTextController.text,
      'petAge': petAgeTextController.text,
      'petColor': petColorTextController.text,
      'petGender': petGender,
      'petVaccinated': petVaccinated,
      'petCategory': petCategory,
      'ownerBio': ownerBioTextController.text,
      'ownerSocialMedia': ownerSocialMediaTextController.text,
      'petImages': ['img1', 'img2']
    };
    debugPrint(registerJson.toString());
  }
}
