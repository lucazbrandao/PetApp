import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petapp/controllers/bottom_navbar_controller.dart';
import 'package:petapp/theme/color.dart';

import '../../theme/sizes.dart';
import 'nav_item.dart';

class PetBottomNavBar extends StatefulWidget {
  const PetBottomNavBar({super.key});

  @override
  _PetBottomNavBarState createState() => _PetBottomNavBarState();
}

class _PetBottomNavBarState extends State<PetBottomNavBar> with SingleTickerProviderStateMixin {

  late TabController _controller;
  final _presenter = Modular.get<BottomNavigationBarController>(); 


  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _presenter.getNavigationController,
      builder: (context, snapshot) {
        final i = snapshot.data ?? 0;

        return Container(
      
          height: 85,
          color: Colors.white,
          alignment: FractionalOffset.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.98,
                color: Colors.grey.withOpacity(0.25),
              ),
              sizedBox10,
              TabBar(
                controller: _controller,
                onTap: (i) => _presenter.setPage(i),
                indicatorColor: Colors.transparent,
                labelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
                unselectedLabelStyle: const TextStyle(fontSize: 10),
                tabs: [
                  NavigationItem(
                    icon: i == 0 ? 'home.svg' : 'home-border.svg',
                    text: 'Início',
                    color: _getColor(i, 0),
                  ),
                  NavigationItem(
                    icon: i == 1 ? 'pet.svg' : 'pet-border.svg',
                    text: 'Adotar',
                    color: _getColor(i, 1),
                  ),
                  NavigationItem(
                    icon: i == 2 ? 'setting.svg' : 'setting-border.svg',
                    text: 'Configurações',
                    color: _getColor(i, 2),
                  ),
                ],
              ),
              sizedBox30
            ],
          ),
        );
      }
    );
  }

  Color _getColor(int currentIndex, int iconPosition) =>
      currentIndex == iconPosition ? AppColor.secondary : Colors.black;

}