// ignore_for_file: file_names

import 'package:farm_qow/Model/storage.dart';
import 'package:farm_qow/Model/user_model.dart';
import 'package:farm_qow/Pages/MainPage/Akun/UbahManager.dart';
import 'package:flutter/material.dart';

import '../../../Login.dart';
import '../../../main.dart';
import 'ListPegawai.dart';

class PreviewAkun extends StatefulWidget {
  // const PreviewAkun({Key? key}) : super(key: key);

  @override
  _PreviewAkunState createState() => _PreviewAkunState();
}

class _PreviewAkunState extends State<PreviewAkun> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                user_login[1],
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                user_login[0],
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
                    user_login[8] == false ? "Pegawai Pengecekan" : "Manager",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                user_login[8] == true
                    ? IconButton(
                        onPressed: () {
                          Navigator.push(
                              context, Transition(UbahDataManager()));
                        },
                        icon: Icon(Icons.edit))
                    : Container(),
              ],
            ),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Warning"),
                              content: Text("Yakin Untuk Logout ? "),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Tidak"),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    User userLogin = User();
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) {
                                      return LoginPage();
                                    }));
                                  },
                                  child: Text("Iya"),
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      color: Colors.white,
                      width: 100,
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      Navigator.push(context, Transition(ListPegawai()));
                    },
                    child: Container(
                      color: Colors.white,
                      // width: 100,
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          Text(
                            "Lihat Pegawai",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
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
                  user_login[2] + ", " + user_login[3],
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
                  user_login[4],
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
                  user_login[5],
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
                  user_login[6],
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
                  user_login[9],
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
