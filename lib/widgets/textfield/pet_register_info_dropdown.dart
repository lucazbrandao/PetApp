import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:petapp/theme/color.dart';

import '../../theme/sizes.dart';

class PetRegisterInfoDropdown<T> extends StatefulWidget {
  final String label;
  final List<DropdownMenuItem<T>> items;
  final Function(dynamic) onValueSelected;
  final T? initialValue;

  const PetRegisterInfoDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.onValueSelected,
    this.initialValue,
  });

  @override
  State<PetRegisterInfoDropdown> createState() =>
      _PetRegisterInfoDropdownState();
}

class _PetRegisterInfoDropdownState extends State<PetRegisterInfoDropdown> {
  var _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        sizedBox5,
        DropdownButtonHideUnderline(
          key: widget.key,
          child: DropdownButtonFormField2(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: AppColor.secondary),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: AppColor.secondary),
              ),
            ),
            hint: Text(
              'Selecionar',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: widget.items,
            value: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
                widget.onValueSelected(value);
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Campo obrigatório';
              }
              return null;
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 60,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}
