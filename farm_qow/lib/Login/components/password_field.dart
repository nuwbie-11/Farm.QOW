import 'package:farm_qow/Login/components/text_field_container.dart';
import 'package:flutter/material.dart';

class PasswordFieldContainer extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PasswordFieldContainer({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
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
