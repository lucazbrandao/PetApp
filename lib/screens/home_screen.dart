import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petapp/controllers/home_controller.dart';
import 'package:petapp/model/pet_category_type.dart';
import 'package:petapp/model/pet_model.dart';
import 'package:petapp/screens/dialogs/change_location_dialog.dart';
import 'package:petapp/theme/sizes.dart';
import 'package:petapp/utils/pet_dialog.dart';
import 'package:petapp/widgets/list/pet_list_item.dart';
import 'package:petapp/widgets/text/home_nickname.dart';
import 'package:petapp/widgets/textfield/pet_searchbar.dart';

import '../widgets/list/category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
              child: Row(
                children: [
                  HomeNickName(name: 'Lucas'),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      showPetDialog(
                        context,
                        'Local de Pesquisa',
                        ChangeLocationDialog(),
                      );
                    },
                    icon: Icon(
                      Icons.pin_drop_outlined,
                    ),
                  )
                ],
              ),
            ),
            sizedBox20,
            PetSearchBar(
              controller: homeController.textSearchController,
              hintText: 'Conselheiro Lafaiete, MG ...',
            ),
            sizedBox30,
            _buildCategories(),
            sizedBox30,
            StreamBuilder<List<PetModel>>(
              initialData: [],
              stream: homeController.petList,
              builder: (_, list) {
                return _buildPetList(list.data!);
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 16),
      child: StreamBuilder<List<PetCategoryType>>(
        initialData: [],
        stream: homeController.petCategories,
        builder: (_, snap) {
          final categoryList = snap.data!;
          final list = List.generate(
            categoryList.length,
            (index) => CategoryItem(
              data: categoryList[index],
              selected: index == homeController.selectedPetCategory,
              onTap: () {
                setState(() {
                  homeController.selectPetCategory(index);
                });
              },
            ),
          );
          return Row(children: list);
        },
      ),
    );
  }

  Widget _buildPetList(List<PetModel> pets) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 16,
          mainAxisExtent: 220,
        ),
        itemCount: pets.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              Modular.to.pushNamed(
                  '/pet/adoption/petdetails/${pets[index].advId}',
                  forRoot: true);
            },
            child: PetListItem(pet: pets[index]),
          );
        },
      ),
    );
  }
}
