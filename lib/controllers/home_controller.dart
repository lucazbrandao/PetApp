import 'package:flutter/material.dart';
import 'package:petapp/model/pet_category_type.dart';
import 'package:petapp/model/pet_model.dart';
import 'package:petapp/model/pet_type.dart';
import 'package:petapp/utils/data.dart';
import 'package:rxdart/rxdart.dart';

class HomeController {
  final BehaviorSubject<List<PetModel>> _pets =
      BehaviorSubject<List<PetModel>>.seeded(
          petAdoptionList.map((e) => e['pet'] as PetModel).toList());
  get petList => _pets.stream;
  set _filterPetList(value) => _pets.sink.add(value);

  final BehaviorSubject<List<PetCategoryType>> _petCategories =
      BehaviorSubject<List<PetCategoryType>>.seeded(categ);
  get petCategories => _petCategories.stream;

  int _selectedPetCategoryIndex = 0;
  get selectedPetCategory => _selectedPetCategoryIndex;

  final List<PetModel> _petListBkp =
      petAdoptionList.map((e) => (e['pet'] as PetModel).clone()).toList();

  final textSearchController = TextEditingController();

  HomeController() {
    textSearchController.addListener(() {
      if (textSearchController.value.text.isEmpty &&
          _getPetSelectedCategory() == PetCategory.all) {
        _clearPetSearchFilter();
      } else {
        _searchPet();
      }
    });
  }

  void _clearPetSearchFilter() {
    _filterPetList = _petListBkp;
  }

  void _searchPet() {
    final isSearchTextIsEmpty = textSearchController.value.text.isEmpty;
    final filteredList = _petListBkp
        .where((e) =>
            e.type.checkType(_getPetSelectedCategory()) &&
            (isSearchTextIsEmpty
                ? true
                : e
                    .toFilter()
                    .contains(textSearchController.value.text.toLowerCase())))
        .toList();

    _filterPetList = filteredList;
  }

  void selectPetCategory(int categoryIndex) {
    _selectedPetCategoryIndex = categoryIndex;
    _searchPet();
  }

  PetCategory _getPetSelectedCategory() {
    return _petCategories.value![_selectedPetCategoryIndex].category;
  }
}
