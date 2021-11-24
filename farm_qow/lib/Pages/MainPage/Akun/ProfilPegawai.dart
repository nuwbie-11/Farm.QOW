// ignore_for_file: file_names

import 'package:farm_qow/Controller/user_controller.dart';
import 'package:farm_qow/Model/storage.dart';
import 'package:farm_qow/Pages/MainPage/MainPage.dart';
import 'package:farm_qow/main.dart';
import 'package:flutter/material.dart';

import '../../../Login.dart';
import 'UbahPegawai.dart';

class ProfilPegawai extends StatefulWidget {
  String nik;
  ProfilPegawai(this.nik);
  // const ProfilPegawai({Key? key}) : super(key: key);

  @override
  _ProfilPegawaiState createState() => _ProfilPegawaiState();
}

class _ProfilPegawaiState extends State<ProfilPegawai> {
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

  @override
  Widget build(BuildContext context) {
    var data;

    for (int i = 0; i < user_account.length; i++) {
      if (user_account[i][0] == widget.nik) {
        data = user_account[i];
        // print(data);
      }
    }
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text('Profil Pegawai'),
                IconButton(
                  onPressed: () {
                    if (user_login[8] == true) {
                      Navigator.push(context,
                          TransitionTopToBottom(UbahDataPegawai(widget.nik)));
                    }
                  },
                  icon: Icon(
                    Icons.edit,
                    color: user_login[8] == true
                        ? Colors.white
                        : Colors.transparent,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data[1],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      data[0],
                      style: TextStyle(fontSize: 28),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Posisi",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),

                          // border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Text(
                          data[8] == false ? "Pegawai Pengecekan" : "Manager",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tempat, Tanggal Lahir",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      Text(
                        data[3] + ", " + data[2],
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Jenis Kelamin",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      Text(
                        data[4],
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Alamat",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      Text(
                        data[5],
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Status Perkawinan",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      Text(
                        data[6],
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Agama",
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                      Text(
                        data[9],
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                user_login[8] == true
                    ? Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Apakah Anda Yakin"),
                                      content: Text("Menghapus " + data[1]),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {
                                              setState(() {
                                                Navigator.of(context)
                                                    .pop(false);
                                              });
                                            },
                                            child: Text(
                                              "no",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )),
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              for (int i = 0;
                                                  i < user_account.length;
                                                  i++) {
                                                if (user_account[i][0] ==
                                                    widget.nik) {
                                                  user_account.removeAt(i);
                                                  UserController()
                                                      .simpan(user_account);
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                    return MyApp(3);
                                                  }));
                                                  break;
                                                }
                                              }
                                            });
                                          },
                                          child: Text("Yes",
                                              style: TextStyle(
                                                  color: Colors.blue)),
                                        )
                                      ],
                                    );
                                  }).then((value) => null);
                            });
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          child: Container(
                              height: 60,
                              child: Center(
                                  child: Text(
                                "Hapus",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ))),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
