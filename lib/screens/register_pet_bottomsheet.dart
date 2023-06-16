import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petapp/model/pet_category_type.dart';
import 'package:petapp/theme/color.dart';
import 'package:petapp/theme/sizes.dart';
import 'package:petapp/utils/data.dart';
import 'package:petapp/widgets/button/pet_button.dart';
import 'package:petapp/widgets/textfield/register_pet_textfield.dart';

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
                      RegisterPetTextField(controller: null, label: 'Nome'),
                      sizedBox10,
                      RegisterPetTextField(controller: null, label: 'Raça'),
                      sizedBox10,
                      RegisterPetTextField(
                          controller: null, label: 'Bio do pet'),
                      sizedBox10,
                      RegisterPetTextField(controller: null, label: 'Idade'),
                      sizedBox10,
                      RegisterPetTextField(controller: null, label: 'Cor'),
                      sizedBox10,
                      RegisterPetTextField(
                          controller: null, label: 'Bio do dono'),
                      sizedBox10,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Categoria'),
                          SizedBox(
                            width: 100,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                hint: Text(
                                  'Selecionar',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: listOptionsCategory
                                    .map(
                                        (item) => DropdownMenuItem<PetCategory>(
                                              value: item.category,
                                              child: Text(
                                                item.name,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                    .toList(),
                                value: selectedOptionCategory,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOptionCategory =
                                        value as PetCategory;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBox10,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Gênero'),
                          SizedBox(
                            width: 100,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                hint: Text(
                                  'Selecionar',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
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
                                value: selectedOptionGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOptionGender = value as String;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBox10,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pet com vacinas em dia?'),
                          SizedBox(
                            width: 100,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                hint: Text(
                                  'Selecionar',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
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
                                value: selectedOptionVaccinated,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOptionVaccinated = value as String;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBox10,
                      SizedBox(
                        height: 200,
                        child: _selectedImages?.length == 0 ||
                                _selectedImages == null
                            ? EmptyImagesSelectedContainer(
                                onTap: () async {
                                  final ImagePicker picker = ImagePicker();

                                  final List<XFile> pickedFileList =
                                      await picker.pickMultiImage();

                                  setState(() {
                                    _selectedImages = pickedFileList;
                                  });
                                },
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: _selectedImages?.length ?? 0,
                                itemBuilder: (_, index) {
                                  return ContainerWithCloseButton(
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
                      sizedBox10,
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
}

class EmptyImagesSelectedContainer extends StatelessWidget {
  final VoidCallback onTap;

  const EmptyImagesSelectedContainer({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200],
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              color: Colors.grey[400],
              size: 100,
            ),
            Text(
              'Adicionar Imagens',
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerWithCloseButton extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onClosePressed;

  const ContainerWithCloseButton({
    super.key,
    required this.imageUrl,
    required this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          width: 200,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(imageUrl),
              fit: BoxFit.fitHeight,
              errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) =>
                  const Center(child: Text('This image type is not supported')),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 20,
          child: InkWell(
            onTap: onClosePressed,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColor.secondary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
