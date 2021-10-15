import 'package:farm_qow/Login/components/text_field_container.dart';
import 'package:flutter/material.dart';

class PasswordFieldContainer extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  const PasswordFieldContainer({
    Key? key,
    required this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Password",
            icon: Icon(Icons.lock),
            suffixIcon: Icon(
              Icons.visibility,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
