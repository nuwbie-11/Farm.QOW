// ignore_for_file: file_names

import 'package:farm_qow/Controller/user_controller.dart';
import 'package:farm_qow/Model/storage.dart';
import 'package:flutter/material.dart';

import '../../../Login.dart';
import '../MainPage.dart';

var dataInputUbahManager = ["", "", "", "", "", "", "", "", 1, ""];

class UbahDataManager extends StatefulWidget {
  // const UbahDataManager({Key? key}) : super(key: key);

  @override
  _UbahDataManagerState createState() => _UbahDataManagerState();
}

class _UbahDataManagerState extends State<UbahDataManager> {
  List user_account = [];

  void upUser() async {
    final tempCheckUp = await UserController().getDataUser();
    setState(() {
      user_account = tempCheckUp;
    });
  }

  @override
  void initState() {
    super.initState();
    upUser();
    // mod.resetWrite();
  }

  bool passwordVision = false;
  TextEditingController namaInput = new TextEditingController();
  TextEditingController passwordInput = new TextEditingController();
  TextEditingController tempatInput = new TextEditingController();
  TextEditingController alamatInput = new TextEditingController();
  var tanggalLahir = DateTime.now();
  var stringTanggalLahir = "pilih tanggal";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/bg/bg5.jpg",
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(143, 197, 255, 0.95),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              title: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      dataInputUbahManager = [
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        0,
                        ""
                      ];

                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text('Ubah Data Manager'),
                ],
              ),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  border: Border.all(color: Colors.blue, width: 1)),
              child: ListView(
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                      child: Text(
                        "NIK : " + user_login[0],
                        style: TextStyle(fontSize: 25),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      // textAlign: TextAlign.center,
                      controller: namaInput,
                      onChanged: (ValueKey) {
                        dataInputUbahManager[1] = ValueKey;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nama",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: TextField(
                      obscureText: passwordVision == true ? false : true,
                      keyboardType: TextInputType.phone,
                      // textAlign: TextAlign.center,
                      controller: passwordInput,
                      onChanged: (ValueKey) {
                        dataInputUbahManager[7] = ValueKey;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                if (passwordVision == true) {
                                  passwordVision = false;
                                } else {
                                  passwordVision = true;
                                }
                              });
                            },
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      // textAlign: TextAlign.center,
                      controller: tempatInput,
                      onChanged: (ValueKey) {
                        dataInputUbahManager[3] = ValueKey;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Tempat lahir",
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(stringTanggalLahir),
                      // Text(tanggalLahir.toString().substring(0,10)),
                      SizedBox(
                        width: 20,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: tanggalLahir,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030),
                            ).then((value) {
                              setState(() {
                                stringTanggalLahir =
                                    value.toString().substring(0, 10);
                                dataInputUbahManager[2] = stringTanggalLahir;
                                // tanggalLahir = value;
                              });
                              // stringTanggalLahir = "halo halo";
                            });

                            ;
                          },
                          child: Text("tanggal lahir"))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      // textAlign: TextAlign.center,
                      controller: alamatInput,
                      onChanged: (ValueKey) {
                        dataInputUbahManager[5] = ValueKey;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Alamat",
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Jenis Kelamin",
                            style: TextStyle(fontSize: 20),
                          ),
                          JenisKelamin(),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Agama",
                            style: TextStyle(fontSize: 20),
                          ),
                          Agama(),
                        ],
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status Perkawinan",
                            style: TextStyle(fontSize: 20),
                          ),
                          StatusPerkawinan(),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      child: Container(
                          height: 50,
                          child: Center(
                              child: Text(
                            "Edit",
                            style: TextStyle(fontSize: 25),
                          ))),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Confirmasi"),
                                content: Text("Apakah Anda Yakin ?"),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("No")),
                                  FlatButton(
                                      onPressed: () {
                                        dataInputUbahManager[0] = user_login[0];
                                        var defaultData = [
                                          user_login[0],
                                          user_login[1],
                                          user_login[2],
                                          user_login[3],
                                          user_login[4],
                                          user_login[5],
                                          user_login[6],
                                          user_login[7],
                                          user_login[8],
                                          user_login[9]
                                        ];
                                        for (int i = 0;
                                            i < dataInputUbahManager.length;
                                            i++) {
                                          // apabila inputan kosong,maka inputan bernilai pada nilai default
                                          if (dataInputUbahManager[i] == "") {
                                            dataInputUbahManager[i] =
                                                defaultData[i];
                                          }
                                        }

                                        for (int i = 0;
                                            i < user_account.length;
                                            i++) {
                                          if (user_account[i][0] ==
                                              userLogin.nik) {
                                            user_account[i] =
                                                dataInputUbahManager;
                                            // user_login = dataInputUbahManager;
                                            user_login[0] =
                                                dataInputUbahManager[0];
                                            user_login[1] =
                                                dataInputUbahManager[1];
                                            user_login[2] =
                                                dataInputUbahManager[2];
                                            user_login[3] =
                                                dataInputUbahManager[3];
                                            user_login[4] =
                                                dataInputUbahManager[4];
                                            user_login[5] =
                                                dataInputUbahManager[5];
                                            user_login[6] =
                                                dataInputUbahManager[6];
                                            user_login[7] =
                                                dataInputUbahManager[7];
                                            user_login[8] =
                                                dataInputUbahManager[8];
                                            user_login[9] =
                                                dataInputUbahManager[9];
                                            // print("user login = ");
                                            // print(user_login);
                                            dataInputUbahManager = [
                                              "",
                                              "",
                                              "",
                                              "",
                                              "",
                                              "",
                                              "",
                                              "",
                                              0,
                                              ""
                                            ];
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return MyApp(3);
                                            }));
                                            // Navigator.of(context).pop();
                                            break;
                                          }
                                        }
                                      },
                                      child: Text("Yes"))
                                ],
                              );
                            });
                      })
                ],
              ),
            )),
      ),
    );
  }
}

class JenisKelamin extends StatefulWidget {
  const JenisKelamin({Key? key}) : super(key: key);

  @override
  State<JenisKelamin> createState() => JenisKelaminState();
}

/// This is the private State class that goes with JenisKelamin.
class JenisKelaminState extends State<JenisKelamin> {
  String dropdownValue = 'Laki-laki';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      iconSize: 24,
      elevation: 2,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          // print(newValue);
          dataInputUbahManager[4] = newValue.toString();
          dropdownValue = newValue!;
        });
      },
      items: <String>['Laki-laki', 'Perempuan']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        );
      }).toList(),
    );
  }
}

class Agama extends StatefulWidget {
  // const Agama({Key? key}) : super(key: key);

  @override
  State<Agama> createState() => AgamaState();
}

/// This is the private State class that goes with Agama.
class AgamaState extends State<Agama> {
  String dropdownValue = 'Islam';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      iconSize: 24,
      elevation: 2,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          // print(newValue);
          dataInputUbahManager[9] = newValue.toString();
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'Islam',
        'Kristen',
        'Katolik',
        'Hindu',
        'Budha',
        'Konggucu',
        'Atheis',
        'Satanic'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        );
      }).toList(),
    );
  }
}

class StatusPerkawinan extends StatefulWidget {
  // const StatusPerkawinan({Key? key}) : super(key: key);

  @override
  State<StatusPerkawinan> createState() => StatusPerkawinanState();
}

/// This is the private State class that goes with StatusPerkawinan.
class StatusPerkawinanState extends State<StatusPerkawinan> {
  String dropdownValue = 'Kawin';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      iconSize: 24,
      elevation: 2,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          // print(newValue);
          dataInputUbahManager[6] = newValue.toString();
          dropdownValue = newValue!;
        });
      },
      items: <String>['Kawin', 'Belum Kawin', "Cerai Hidup"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        );
      }).toList(),
    );
  }
}
