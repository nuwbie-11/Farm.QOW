import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Model/storage.dart';
import 'package:farm_qow/Pages/MainPage/MainPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var obsuced = true;
  var usernameInput;
  var passwordInput;
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
                  // textAlign: TextAlign.center,
                  autofocus: false,
                  onChanged: (ValueKey) {
                    usernameInput = ValueKey.toString();
                  },

                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      size: 45,
                    ),
                    border: OutlineInputBorder(),
                    hintText: "Username",
                    labelText: "Username",
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
                      if (usernameInput == "manager" &&
                          passwordInput == "happymanager") {
                        user_login.add("manager");
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return MyApp(
                            0,
                          );
                        }));
                      } else {
                        user_login
                            .add([usernameInput, passwordInput, "pegawai"]);
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return MyApp(
                            0,
                          );
                        }));
                      }
                      // setState(() {
                      //
                      // });
                      // print(usernameInput);
                      // print(passwordInput);
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
