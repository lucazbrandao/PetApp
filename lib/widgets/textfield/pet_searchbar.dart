import 'package:flutter/material.dart';
import 'package:petapp/theme/color.dart';

class PetSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PetSearchBar(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  _PetSearchBarState createState() => _PetSearchBarState();
}

class _PetSearchBarState extends State<PetSearchBar> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(13.0),
                  bottomLeft: Radius.circular(13.0),
                  topLeft: Radius.circular(13.0),
                  topRight: Radius.circular(13.0),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 6, top: 4),
                child: TextFormField(
                  controller: widget.controller,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: AppColor.secondary,
                        size: 24,
                      ),
                      onPressed: () {
                        _focusNode.nextFocus();
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.2,
                      color: Colors.grey,
                    ),
                  ),
                  cursorColor: AppColor.secondary,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  focusNode: _focusNode,
                  onEditingComplete: () {},
                  onFieldSubmitted: (value) {
                    _focusNode.unfocus();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
