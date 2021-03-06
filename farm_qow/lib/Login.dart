// ignore_for_file: file_names

import 'package:farm_qow/Controller/user_controller.dart';
import 'package:farm_qow/Model/storage.dart';
import 'package:farm_qow/Model/user_model.dart';
import 'package:farm_qow/Pages/MainPage/MainPage.dart';
import 'package:flutter/material.dart';

User userLogin = User();

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List user_account = [];
  void upUser() async {
    final tempUser = await UserController().getDataUser();
    // if (tempUser == []) {
    //   print("No Accounts Saved");
    // }
    setState(() {
      user_account = tempUser;
    });
  }

  @override
  void initState() {
    super.initState();
    upUser();
  }

  var obsuced = true;
  var nikInput = '';
  var passwordInput = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Image.asset("assets/images/lc_n.png"),
            Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  onChanged: (ValueKey) {
                    nikInput = ValueKey.toString();
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      size: 45,
                    ),
                    border: OutlineInputBorder(),
                    hintText: "NIK",
                    labelText: "NIK",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  // textAlign: TextAlign.center,
                  autofocus: false,
                  obscureText: obsuced,
                  onChanged: (ValueKey) {
                    passwordInput = ValueKey.toString();
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      size: 45,
                    ),
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        if (obsuced == true) {
                          setState(() {
                            obsuced = false;
                          });
                        } else {
                          setState(() {
                            obsuced = true;
                          });
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      // print(nikInput);
                      // print(passwordInput);
                      // print("USERS : $user_account");
                      if (nikInput == "3510161111000000" &&
                          passwordInput == "admin123") {
                        user_login = user_account[0];

                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return MyApp(
                            0,
                          );
                        }));
                      } else {
                        bool isValidate = false;
                        for (int i = 0; i < user_account.length; i++) {
                          if (user_account[i][0] == nikInput &&
                              user_account[i][7] == passwordInput) {
                            isValidate = true;
                            user_login = user_account[i];
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return MyApp(0);
                            }));
                            break;
                          }
                        }

                        if (isValidate == false) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // title: Text("Warning"),
                                  content: Text(
                                      "NIK atau Password yang anda masukan salah! "),
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: Text("Ya",
                                          style: TextStyle(color: Colors.blue)),
                                    )
                                  ],
                                );
                              }).then((value) => null);
                        }
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      child: Center(
                        child: Text("Submit",
                            style:
                                TextStyle(color: Colors.white, fontSize: 21)),
                      ),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
