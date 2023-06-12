import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../theme/sizes.dart';

class ChangeLocationDialog extends StatefulWidget {
  const ChangeLocationDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangeLocationDialog> createState() => _ChangeLocationDialogState();
}

class _ChangeLocationDialogState extends State<ChangeLocationDialog> {
  final inputController = TextEditingController();

  final List<String> items = [
    'Conselheiro Lafaiete, MG',
    'Belo Horizonte, MG',
    'Juiz de Fora, MG',
    'Maringá, PR',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Filtre o local de pesquisa.',
            ),
            sizedBox20,
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  'Nenhum local selecionado',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
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
                        'Local de Pesquisa não foi implementado.',
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
