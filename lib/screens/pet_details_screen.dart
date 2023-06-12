import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petapp/model/pet_model.dart';
import 'package:petapp/model/pet_owner_model.dart';
import 'package:petapp/theme/sizes.dart';
import 'package:petapp/utils/data.dart';
import 'package:petapp/widgets/button/pet_button.dart';

import '../model/pet_type.dart';

class PetDetailsScreen extends StatefulWidget {
  final String advId;
  const PetDetailsScreen({super.key, required this.advId});

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  int _currentIndicator = 0;
  final CarouselController _carouselController = CarouselController();

  late PetOwnerModel petOwner;
  late PetModel petModel;

  @override
  void initState() {
    super.initState();
    petOwner = getPetOwnerByAdvId(widget.advId);
    petModel = getPetModelByAdvId(widget.advId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: 350,
                    enlargeCenterPage: false,
                    disableCenter: true,
                    viewportFraction: 1,
                    pageSnapping: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndicator = index;
                      });
                    },
                  ),
                  items: List.generate(
                    petModel.images.length,
                    (index) => Hero(
                      tag: petModel.advId,
                      child: Container(
                        width: double.infinity,
                        height: 350.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(petModel.images[index]
                                // "https://images.unsplash.com/photo-1529778873920-4da4926a72c2",
                                ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: petModel.images.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () {
                            _carouselController.animateToPage(entry.key);
                            setState(() {
                              _currentIndicator = entry.key;
                            });
                          },
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(
                                    _currentIndicator == entry.key ? 1 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 10.0),
                  child: IconButton(
                    onPressed: () => Modular.to.pop(),
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    petModel.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '(${petModel.race})',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            sizedBox5,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                petModel.bioDescription,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 6.0),
                  _buildInfoCard('Idade', petModel.age),
                  _buildInfoCard('Sexo',
                      petModel.gender == PetGender.male ? 'Macho' : 'Fêmea'),
                  _buildInfoCard('Cor', petModel.color),
                  _buildInfoCard(
                      'Vacinado', petModel.vaccinated ? 'Sim' : 'Não'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, top: 30.0),
              width: double.infinity,
              height: 90.0,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8.0,
                ),
                leading: CircleAvatar(
                  child: ClipOval(
                    child: Image(
                      height: 40.0,
                      width: 40.0,
                      image: NetworkImage(profile),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  petOwner.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Dono',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Text(
                petOwner.bioDescription,
                style: TextStyle(
                  fontSize: 15.0,
                  height: 1.5,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 30, bottom: 40),
              child: PetButton(label: 'VER CONTATO', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String info) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 100.0,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            info,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
