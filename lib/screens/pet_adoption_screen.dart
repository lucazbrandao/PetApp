import 'package:flutter/material.dart';
import 'package:petapp/screens/register_pet_bottomsheet.dart';
import 'package:petapp/theme/color.dart';
import 'package:petapp/theme/sizes.dart';
import 'package:petapp/widgets/list/pet_adoption_item.dart';

class PetAdoptionScreen extends StatefulWidget {
  const PetAdoptionScreen({super.key});

  @override
  State<PetAdoptionScreen> createState() => _PetAdoptionScreenState();
}

class _PetAdoptionScreenState extends State<PetAdoptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: TextButton.icon(
        label: Text(
          'Cadastrar pet',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.add, size: 30),
        onPressed: () {
          addPetBottomSheet();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(16),
          backgroundColor: AppColor.secondary,
          foregroundColor: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox30,
              Text(
                'Meus Pets para adoção',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              sizedBox20,
              PetAdoptionItem(),
              PetAdoptionItem(),
              PetAdoptionItem(),
              PetAdoptionItem(),
              // SizedBox(
              //   width: 200,
              //   child: Expanded(
              //     // height: 300,
              //     child: ListView(
              //       shrinkWrap: true,
              //       children: [
              //         PetAdoptionItem(),
              //         PetAdoptionItem(),
              //         PetAdoptionItem(),
              //         PetAdoptionItem(),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void addPetBottomSheet() {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return RegisterPetBottomSheet(
          closeAction: () => Navigator.pop(context),
        );
      },
    );
  }
}
