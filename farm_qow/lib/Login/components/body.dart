// ignore_for_file: deprecated_member_use

import 'package:farm_qow/Login/components/input_field.dart';
import 'package:farm_qow/Login/components/password_field.dart';
import 'package:farm_qow/Login/components/round_button.dart';
import 'package:farm_qow/constant.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 35),
              child: Image.asset(
                "assets/images/Logo.png",
                width: size.width * 0.45,
              ),
            ),
            InputField(
              hintText: "Username",
              icon: Icon(Icons.person),
              onChanged: (value) {},
            ),
            // ignore: prefer_const_constructors
            PasswordFieldContainer(
              onChanged: (value) {},
            ),
            RoundedButton(
              size: size,
              title: "Login",
              press: () {},
              color: kPrimary,
              textColor: Colors.white,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lupa Password?",
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Hubungi Admin"),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
