import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petapp/controllers/register_pet_bottomsheet_controller.dart';
import 'package:petapp/model/pet_category_type.dart';
import 'package:petapp/theme/sizes.dart';
import 'package:petapp/utils/data.dart';
import 'package:petapp/widgets/button/pet_button.dart';
import 'package:petapp/widgets/button/selected_image_button.dart';
import 'package:petapp/widgets/textfield/pet_register_info_dropdown.dart';

import '../model/user_pet_adoption_model.dart';
import '../widgets/button/empty_imageselector_button.dart';
import '../widgets/textfield/pet_register_info_textfield.dart';

class RegisterPetBottomSheet extends StatefulWidget {
  final VoidCallback closeAction;
  final UserPetAdoptionModel? userPetAdoption;

  const RegisterPetBottomSheet({
    super.key,
    required this.closeAction,
    this.userPetAdoption,
  });

  @override
  State<RegisterPetBottomSheet> createState() => _RegisterPetBottomSheetState();
}

class _RegisterPetBottomSheetState extends State<RegisterPetBottomSheet> {
  final listOptionsVaccinated = ['Sim', 'Não'];
  String? selectedOptionVaccinated;

  final listOptionsGender = ['Macho', 'Fêmea'];
  String? selectedOptionGender;

  final listOptionsCategory = petCategoryStaticList
      .where((e) => e.category != PetCategory.all)
      .toList();

  PetCategory? selectedOptionCategory;

  final _bottomsheetController = RegisterPetBottomSheetController();
  final _formKey = GlobalKey<FormState>();

  var _isEdition = false;

  @override
  void initState() {
    super.initState();
    _isEdition = widget.userPetAdoption != null;
    _bottomsheetController.checkIsAdvertEdit(widget.userPetAdoption);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _isEdition ? 'Editar Anúncio' : 'Cadastrar Pet',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: widget.closeAction,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black.withOpacity(0.4),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Scrollbar(
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PetRegisterInfoTextfield(
                          controller:
                              _bottomsheetController.petNameTextController,
                          label: 'Nome',
                          hint: 'Nome ou apelido do seu pet',
                        ),
                        sizedBox10,
                        PetRegisterInfoTextfield(
                          controller:
                              _bottomsheetController.petRaceTextController,
                          label: 'Raça',
                          hint: 'Ex: Vira Lata',
                        ),
                        sizedBox10,
                        PetRegisterInfoTextfield(
                          controller:
                              _bottomsheetController.petBioTextController,
                          label: 'Bio do pet',
                          hint:
                              'Ex: O meu pet é muito dócil e brincalhão! Não faz bagunça',
                          isBioField: true,
                        ),
                        sizedBox10,
                        PetRegisterInfoTextfield(
                          controller:
                              _bottomsheetController.petAgeTextController,
                          label: 'Idade',
                          hint: 'Ex: 1 ano / 3 meses',
                        ),
                        sizedBox10,
                        PetRegisterInfoTextfield(
                          controller:
                              _bottomsheetController.petColorTextController,
                          label: 'Cor',
                          hint: 'Ex: Caramelo',
                        ),
                        sizedBox10,
                        PetRegisterInfoTextfield(
                          controller:
                              _bottomsheetController.ownerBioTextController,
                          label: 'Bio do dono',
                          hint:
                              'Ex: Sou um amante nato dos animais. Preciso adotar meu pet pois estou de mudança etc...',
                          isBioField: true,
                        ),
                        sizedBox10,
                        PetRegisterInfoTextfield(
                          controller:
                              _bottomsheetController.ownerSMTextController,
                          label: 'Mídias Sociais',
                          hint:
                              'Ex: Instagram: @fulano_123\nFacebook: @fulano123',
                          isBioField: true,
                        ),
                        sizedBox10,
                        PetRegisterInfoDropdown(
                          label: 'Categoria',
                          initialValue: _bottomsheetController.petCategory,
                          onValueSelected: (value) {
                            _bottomsheetController.petCategory =
                                (value as PetCategory);
                          },
                          items: listOptionsCategory
                              .map((item) => DropdownMenuItem<PetCategory>(
                                    value: item.category,
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        sizedBox10,
                        PetRegisterInfoDropdown(
                          label: 'Gênero',
                          initialValue: _bottomsheetController.petGender,
                          onValueSelected: (value) {
                            _bottomsheetController.petGender = value;
                          },
                          items: listOptionsGender
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        sizedBox10,
                        PetRegisterInfoDropdown(
                          label: 'Pet com vacinas em dia?',
                          initialValue: _bottomsheetController.petVaccinated,
                          onValueSelected: (value) {
                            _bottomsheetController.petVaccinated = value;
                          },
                          items: listOptionsVaccinated
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        sizedBox20,
                        SizedBox(
                          height: 200,
                          child: _emptyImagesContainerConditional()
                              ? EmptyImagesSelectedContainer(
                                  isEdition: _isEdition,
                                  onTap: () async {
                                    _selectImages();
                                  },
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _imagesItemCount(),
                                  itemBuilder: (_, index) {
                                    return SelectedImageButton(
                                      isEdition: _isEdition,
                                      imageUrl: _imageUrlByIndex(index),
                                      onClosePressed: () {
                                        setState(() {
                                          _bottomsheetController.selectedImages
                                              .removeAt(index);
                                        });
                                      },
                                    );
                                  },
                                ),
                        ),
                        sizedBox20,
                        PetButton(
                          label: 'Concluir Cadastro',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _bottomsheetController.submiteForm();
                              Navigator.of(context).pop();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectImages() async {
    try {
      final ImagePicker picker = ImagePicker();
      final List<XFile> pickedFileList = await picker.pickMultiImage();

      setState(() {
        _bottomsheetController.selectedImages = pickedFileList;
      });
    } on Exception {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Erro ao selecionar imagens',
          ),
        ),
      );
    }
  }

  bool _emptyImagesContainerConditional() {
    return (_bottomsheetController.selectedImages.isEmpty && !_isEdition) ||
        (_isEdition && _bottomsheetController.advImages.isEmpty);
  }

  int _imagesItemCount() {
    return _isEdition
        ? _bottomsheetController.advImages.length
        : _bottomsheetController.selectedImages.length;
  }

  String _imageUrlByIndex(int index) {
    return _isEdition
        ? _bottomsheetController.advImages[index]
        : _bottomsheetController.selectedImages[index].path;
  }
}
