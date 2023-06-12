import 'package:flutter/material.dart';
import 'package:petapp/theme/color.dart';

class PetOwnerContactDialog extends StatelessWidget {
  final String socialMediaDescription;
  final String phoneNumber;

  const PetOwnerContactDialog(
      {super.key,
      required this.socialMediaDescription,
      required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            minVerticalPadding: 10,
            title: Text(
              'Redes Sociais',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(socialMediaDescription),
            ),
          ),
          ListTile(
            title: Text(
              'Telefone',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(phoneNumber),
            trailing: IconButton(
              icon: Icon(
                Icons.call,
                color: AppColor.secondary,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
