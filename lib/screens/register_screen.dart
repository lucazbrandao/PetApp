import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../theme/sizes.dart';
import '../widgets/button/pet_button.dart';
import '../widgets/textfield/pet_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox100,
              const Text(
                'Registrar',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              sizedBox40,
              PetTextField(
                controller: _emailController,
                hintText: 'Digite seu e-mail',
                icon: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                isPassword: false,
              ),
              sizedBox20,
              PetTextField(
                controller: _emailController,
                hintText: 'Digite seu nome',
                icon: Icons.person_2_outlined,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                isPassword: false,
              ),
              sizedBox20,
              PetTextField(
                controller: _passwordController,
                hintText: 'Digite sua senha',
                icon: Icons.lock_outline,
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
                isPassword: true,
              ),
              sizedBox20,
              PetTextField(
                controller: _passwordController,
                hintText: 'Confirme sua senha',
                icon: Icons.lock_outline,
                inputType: TextInputType.text,
                inputAction: TextInputAction.done,
                isPassword: true,
              ),
              sizedBox40,
              PetButton(
                label: 'CRIAR CONTA',
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  Modular.to.navigate('/pet/home');
                },
              ),
              sizedBox20,
              GestureDetector(
                onTap: () {
                  Modular.to.pop();
                },
                child: Container(
                  alignment: FractionalOffset.center,
                  child: const Text(
                    'Voltar',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
              ),
              sizedBox30,
            ],
          ),
        ),
      ),
    );
  }
}
