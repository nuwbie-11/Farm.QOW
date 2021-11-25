// ignore_for_file: file_names

import 'package:farm_qow/Controller/user_controller.dart';
import 'package:farm_qow/Model/storage.dart';
import 'package:farm_qow/Pages/MainPage/Akun/TambahPegawai.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import 'ProfilPegawai.dart';

class ListPegawai extends StatefulWidget {
  // const ListPegawai({Key? key}) : super(key: key);

  @override
  _ListPegawaiState createState() => _ListPegawaiState();
}

class _ListPegawaiState extends State<ListPegawai> {
  List user_account = [];

  void upUser() async {
    final tempCheckUp = await UserController().getDataUser();
    setState(() {
      user_account = tempCheckUp;
      print(user_account);
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text('List Pegawai'),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: user_login[8] == true
              ? FloatingActionButton(
                  onPressed: () {},
                  elevation: 0,
                  child: Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Navigator.push(
                            context, TransitionBottomToTop(TambahPegawai()));
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    );
                  }),
                )
              : null,
          body: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              for (int i = 1; i < user_account.length; i++)
                ItemPegawai(user_account[i][1].toString(),
                    user_account[i][0].toString())
            ],
          ),
        ),
      ),
    );
  }
}

class ItemPegawai extends StatelessWidget {
  String namaPegawai;
  String nik;
  ItemPegawai(this.namaPegawai, this.nik);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
          if (user_login[8] == true) {
            Navigator.push(context, Transition(ProfilPegawai(nik)));
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
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
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        namaPegawai,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(nik),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
