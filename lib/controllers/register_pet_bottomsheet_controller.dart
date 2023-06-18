import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petapp/model/pet_category_type.dart';
import 'package:petapp/model/pet_owner_model.dart';
import 'package:petapp/model/pet_type.dart';

import '../model/pet_model.dart';
import '../model/user_pet_adoption_model.dart';
import '../utils/data.dart';

class RegisterPetBottomSheetController {
  final TextEditingController petNameTextController = TextEditingController();
  final TextEditingController petRaceTextController = TextEditingController();
  final TextEditingController petBioTextController = TextEditingController();
  final TextEditingController petAgeTextController = TextEditingController();
  final TextEditingController petColorTextController = TextEditingController();
  final TextEditingController ownerBioTextController = TextEditingController();
  final TextEditingController ownerSMTextController = TextEditingController();
  String? petGender;
  String? petVaccinated;
  PetCategory? petCategory;

  List<XFile> selectedImages = [];
  List<String> advImages = [];

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
      'ownerSocialMedia': ownerSMTextController.text,
      'petImages': selectedImages.map((e) => e.path).toList()
    };
    debugPrint(registerJson.toString());
  }

  void checkIsAdvertEdit(UserPetAdoptionModel? petAdoptionModel) {
    if (petAdoptionModel != null) {
      var advId = petAdoptionModel.advId.toString();
      var advPetInfo = getPetModelByAdvId(advId);
      var advOwnerInfo = getPetOwnerByAdvId(advId);
      _setTextControllerInfo(advPetInfo, advOwnerInfo);
    }
  }

  void _setTextControllerInfo(PetModel petModel, PetOwnerModel ownerModel) {
    petNameTextController.text = petModel.name;
    petRaceTextController.text = petModel.race;
    petAgeTextController.text = petModel.age;
    petBioTextController.text = petModel.bioDescription;
    petColorTextController.text = petModel.color;
    ownerBioTextController.text = ownerModel.bioDescription;
    ownerSMTextController.text = ownerModel.socialMediaDescription;
    petGender = petModel.gender == PetGender.male ? 'Macho' : 'Fêmea';
    petCategory = petModel.type.getCategory();
    petVaccinated = petModel.vaccinated ? 'Sim' : 'Não';
    advImages = petModel.images;
  }
}
