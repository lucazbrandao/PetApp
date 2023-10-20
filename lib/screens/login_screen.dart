import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petapp/theme/sizes.dart';
import 'package:petapp/widgets/button/pet_button.dart';

import '../utils/pet_dialog.dart';
import '../widgets/textfield/pet_textfield.dart';
import 'dialogs/reset_password_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text(
              'Bem vindo ao PetApp,',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Text(
              'faça o login para continuar.',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            const Spacer(),
            PetTextField(
              controller: _emailController,
              hintText: 'E-mail',
              icon: Icons.email_outlined,
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              isPassword: false,
            ),
            sizedBox20,
            PetTextField(
              controller: _passwordController,
              hintText: 'Senha',
              icon: Icons.lock_outline,
              inputType: TextInputType.text,
              inputAction: TextInputAction.done,
              isPassword: true,
            ),
            GestureDetector(
              onTap: () {
                showPetDialog(
                  context,
                  'Resetar Senha',
                  ResetPasswordDialog(),
                );
              },
              child: Container(
                alignment: FractionalOffset.centerRight,
                padding: const EdgeInsets.only(top: 15.0),
                child: const Text(
                  'Esqueci minha senha.',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
            ),
            const Spacer(),
            PetButton(
              label: 'ENTRAR',
              onPressed: () async {
                FocusScope.of(context).unfocus();
                Modular.to.navigate('/pet/home');
              },
            ),
            sizedBox20,
            GestureDetector(
              onTap: () {
                Modular.to.pushNamed('/register');
              },
              child: Container(
                alignment: FractionalOffset.center,
                child: const Text(
                  'Criar uma conta',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
            ),
            sizedBox30,
          ],
        ),
      ),
    );
  }
}
