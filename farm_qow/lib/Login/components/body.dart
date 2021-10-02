// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:crypt/crypt.dart' show Crypt;
import 'package:farm_qow/Login/components/input_field.dart';
import 'package:farm_qow/Login/components/password_field.dart';
import 'package:farm_qow/Login/components/round_button.dart';
import 'package:farm_qow/constant.dart';
import 'package:farm_qow/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late List _data;
  Future<void> _account() async {
    var res = json.decode(await rootBundle.loadString('json_model/users.json'));
    setState(() {
      _data = res;
    });
  }

  @override
  void initState() {
    super.initState();
    this._account();
  }

  @override
  dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _check() {
    var user = usernameController.text;
    var pwd = passwordController.text;
    for (var item in _data) {
      if (item['username'] == user) {
        if (item['password'] == pwd) {
          return true;
        }
      }
    }
    return false;
  }

  void _navigate() {
    if (_check()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

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
              controller: usernameController,
            ),
            // ignore: prefer_const_constructors
            PasswordFieldContainer(
              onChanged: (value) {},
              controller: passwordController,
            ),
            RoundedButton(
              size: size,
              title: "Login",
              press: _navigate,
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
