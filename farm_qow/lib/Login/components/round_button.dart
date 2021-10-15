import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
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
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: widget.color,
          onPressed: widget.press,
          child: Text(
            widget.title,
            style: TextStyle(color: widget.textColor),
          ),
        ),
      ),
    );
  }
}
