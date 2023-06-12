import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../theme/sizes.dart';
import '../../widgets/textfield/pet_textfield.dart';

class ResetPasswordDialog extends StatelessWidget {
  ResetPasswordDialog({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Ao confirmar, será enviado um link em seu e-mail para redefinir sua senha.',
            ),
            sizedBox20,
            PetTextField(
              icon: Icons.mail_lock,
              controller: emailController,
              hintText: 'E-mail',
              isPassword: false,
              inputType: TextInputType.text,
              inputAction: TextInputAction.done,
            ),
            sizedBox20,
            MaterialButton(
                height: 50,
                color: AppColor.secondary,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Link de recuperação enviado para o e-mail informado.',
                      ),
                    ),
                  );
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.white),
                )),
            sizedBox10,
          ],
        ),
      ),
    );
  }
}
