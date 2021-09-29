import 'package:farm_qow/constant.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/lc_n.png",
            width: size.width * 0.88,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35, vertical: 0),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 1.0, color: kPrimary))
                // borderRadius: BorderRadius.circular(5),
                ),
          )
        ],
      ),
    );
  }
}
