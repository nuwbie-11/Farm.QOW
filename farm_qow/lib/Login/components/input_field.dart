import 'package:farm_qow/Login/components/text_field_container.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const InputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: icon, hintText: hintText, border: InputBorder.none),
      ),
    );
  }
}