import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petapp/theme/color.dart';
import 'package:petapp/theme/sizes.dart';

import '../controllers/bottom_navbar_controller.dart';
import '../utils/data.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileAvatar(profile),
              sizedBox20,
              Text(
                'Lucas Brandão',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              sizedBox5,
              Text(
                'lucazbrandao@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              sizedBox40,
              _buildSettingsItem(
                label: 'Faq',
                leadingIcon: Icons.info,
              ),
              _buildSettingsItem(
                label: 'Termos e condições',
                leadingIcon: Icons.privacy_tip,
              ),
              _buildSettingsItem(
                label: 'Excluir conta',
                leadingIcon: Icons.delete_forever,
                warning: true,
              ),
              _buildSettingsItem(
                label: 'Sair ',
                leadingIcon: Icons.logout,
                onTap: () {
                  Modular.get<BottomNavigationBarController>().dispose();
                  Modular.to.navigate('/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAvatar(String imageUrl) {
    return Container(
      height: 120,
      width: 120,
      margin: EdgeInsets.only(top: 60),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 150,
            backgroundImage: NetworkImage(imageUrl),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: AppColor.secondary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
      {required String label,
      required IconData leadingIcon,
      bool warning = false,
      VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap ??
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '$label não implementado.',
                ),
              ),
            );
          },
      title: Text(
        label,
        style: TextStyle(
          color: warning ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.secondary,
        ),
        child: Icon(
          leadingIcon,
          color: Colors.white,
          size: 20,
        ),
      ),
      trailing: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
