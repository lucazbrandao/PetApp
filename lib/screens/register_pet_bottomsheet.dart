import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petapp/model/pet_category_type.dart';
import 'package:petapp/theme/sizes.dart';
import 'package:petapp/utils/data.dart';
import 'package:petapp/widgets/button/pet_button.dart';
import 'package:petapp/widgets/button/selected_image_button.dart';
import 'package:petapp/widgets/textfield/pet_register_info_dropdown.dart';

import '../widgets/button/empty_imageselector_button.dart';
import '../widgets/textfield/pet_register_info_textfield.dart';

class RegisterPetBottomSheet extends StatefulWidget {
  final VoidCallback closeAction;

  const RegisterPetBottomSheet({super.key, required this.closeAction});

  @override
  State<RegisterPetBottomSheet> createState() => _RegisterPetBottomSheetState();
}

class _RegisterPetBottomSheetState extends State<RegisterPetBottomSheet> {
  final listOptionsVaccinated = ['Sim', 'Não'];
  String? selectedOptionVaccinated;

  final listOptionsGender = ['Macho', 'Fêmea'];
  String? selectedOptionGender;

  final listOptionsCategory =
      categ.where((e) => e.category != PetCategory.all).toList();
  PetCategory? selectedOptionCategory;

  List<XFile>? _selectedImages;

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
                'Cadastrar Pet',
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
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PetRegisterInfoTextfield(
                        label: 'Nome',
                        hint: 'Nome ou apelido do seu pet',
                      ),
                      sizedBox10,
                      PetRegisterInfoTextfield(
                        label: 'Raça',
                        hint: 'Ex: Vira Lata',
                      ),
                      sizedBox10,
                      PetRegisterInfoTextfield(
                        label: 'Bio do pet',
                        hint:
                            'Ex: O meu pet é muito dócil e brincalhão! Não faz bagunça',
                        isBioField: true,
                      ),
                      sizedBox10,
                      PetRegisterInfoTextfield(
                        label: 'Idade',
                        hint: 'Ex: 1 ano / 3 meses',
                      ),
                      sizedBox10,
                      PetRegisterInfoTextfield(
                        label: 'Cor',
                        hint: 'Ex: Caramelo',
                      ),
                      sizedBox10,
                      PetRegisterInfoTextfield(
                        label: 'Bio do dono',
                        hint:
                            'Ex: Sou um amante nato dos animais. Preciso adotar meu pet pois estou de mudança etc...',
                        isBioField: true,
                      ),
                      sizedBox10,
                      PetRegisterInfoDropdown(
                        label: 'Categoria',
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
                        child:
                            _selectedImages == null || _selectedImages!.isEmpty
                                ? EmptyImagesSelectedContainer(
                                    onTap: () async {
                                      _selectImages();
                                    },
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _selectedImages?.length ?? 0,
                                    itemBuilder: (_, index) {
                                      return SelectedImageButton(
                                        imageUrl:
                                            _selectedImages?[index].path ?? '',
                                        onClosePressed: () {
                                          setState(() {
                                            _selectedImages?.removeAt(index);
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
                          final ImagePicker picker = ImagePicker();

                          final List<XFile> pickedFileList =
                              await picker.pickMultiImage();

                          setState(() {
                            _selectedImages = pickedFileList;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
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
        _selectedImages = pickedFileList;
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
}
