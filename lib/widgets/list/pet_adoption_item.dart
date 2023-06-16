import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petapp/theme/color.dart';

class PetAdoptionItem extends StatelessWidget {
  const PetAdoptionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SvgPicture.asset(
          'assets/icons/dog.svg',
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
            onPressed: () {
              // Ação de exclusão
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: AppColor.secondary,
            ),
            onPressed: () {
              // Ação de exclusão
            },
          ),
        ],
      ),
      title: Text('João'),
      subtitle: Text('joao@example.com'),
    );
  }
}
