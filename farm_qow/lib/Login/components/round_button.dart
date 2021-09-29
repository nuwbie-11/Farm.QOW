import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.size,
    required this.title,
    required this.press,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final Size size;
  final String title;
  final Function()? press;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: color,
          onPressed: press,
          child: Text(
            title,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
