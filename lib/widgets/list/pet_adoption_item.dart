import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petapp/model/user_pet_adoption_model.dart';
import 'package:petapp/theme/color.dart';

import '../../model/pet_type.dart';

class PetAdoptionItem extends StatelessWidget {
  final UserPetAdoptionModel userPetAdoptionModel;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PetAdoptionItem({
    super.key,
    required this.userPetAdoptionModel,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SvgPicture.asset(
          _getSvgAssetFromPetType(userPetAdoptionModel.type),
          color: AppColor.secondary,
        ),
      ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: AppColor.secondary,
            ),
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: AppColor.secondary,
            ),
            onPressed: onDelete,
          ),
        ],
      ),
      title: Text(userPetAdoptionModel.name),
      subtitle: Text(userPetAdoptionModel.race),
    );
  }

  String _getSvgAssetFromPetType(PetType petType) {
    const String baseAssetPath = 'assets/icons';
    switch (petType) {
      case PetType.dog:
        return '$baseAssetPath/dog.svg';
      case PetType.cat:
        return '$baseAssetPath/cat.svg';
      case PetType.fish:
        return '$baseAssetPath/fish.svg';
      case PetType.parrot:
        return '$baseAssetPath/parrot.svg';
      case PetType.turtle:
        return '$baseAssetPath/turtle.svg';
      case PetType.rabbit:
        return '$baseAssetPath/rabbit.svg';
    }
  }
}
