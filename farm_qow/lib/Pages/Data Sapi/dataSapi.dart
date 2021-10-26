// ignore_for_file: file_names

import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Model/new_model.dart';
import 'package:farm_qow/Pages/Halaman%20Susu/HalamanSusu.dart';
import 'package:farm_qow/Pages/Profil%20Sapi/profilSapi.dart';
import 'package:farm_qow/Pages/SearchHalamanSapi/SearchHalamanSapi.dart';
import 'package:farm_qow/Pages/Tambah%20Sapi/TambahSapi.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class HalamanDataSapi extends StatefulWidget {
  String search;
  HalamanDataSapi(this.search);

  @override
  _HalamanDataSapiState createState() => _HalamanDataSapiState();
}

class _HalamanDataSapiState extends State<HalamanDataSapi> {
  // Model mod = Model();
  List sapi = [];
  NewSapiModel newSapi = NewSapiModel();
  var mod = Model();

  Future refreshData() async {
    sapi.clear();
    await Future.delayed(Duration(seconds: 2));
    upSapi();
  }

  void upSapi() async {
    mod.sapis = await newSapi.fetch2List();
    setState(() {
      sapi = mod.sapis;
    });
  }

  @override
  void initState() {
    super.initState();
    upSapi();
  }

  @override
  Widget build(BuildContext context) {
    var dataSapi = [];
    for (int i = 0; i < sapi.length; i++) {
      int idSapi = int.parse(sapi[i][0].toString());
      String namaSapi = sapi[i][1].toString();
      String tanggalDatang = sapi[i][3].toString();
      String kesehatanSapi = "null";
      for (int j = (checkup.length) - 1; j > -1; j--) {
        if (checkup[j][1] == idSapi) {
          kesehatanSapi = checkup[j][14].toString();
          break;
        }
      }
      if (namaSapi.toLowerCase().contains(widget.search.toLowerCase()) ==
          true) {
        dataSapi.add([idSapi, namaSapi, tanggalDatang, kesehatanSapi]);
      }
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // theme: ThemeData.dark(),
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/bg/bg5.jpg",
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          endDrawer: Drawer(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(143, 197, 255, 0.95),
                  image: DecorationImage(
                      image: AssetImage("assets/bg/bg5.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Yuk Sri",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.blue))
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          size: 40,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(fontSize: 27),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          appBar: AppBar(
              backgroundColor: Color.fromRGBO(143, 197, 255, 0.95),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              title: Builder(builder: (context) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, Transition(SearchHalamanSapi()));
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    //   return SearchHalamanSapi();
                    // }));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Farm.QOW'),
                        Row(
                          children: [
                            Icon(Icons.search),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })),
          bottomNavigationBar: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Builder(builder: (context) {
                    return Flexible(
                        fit: FlexFit.tight,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, Transition(HalamanDataSapi("")));
                              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                              //   return HalamanDataSapi("");
                              // }));
                            },
                            child: Container(
                                height: 70,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                child: ImageIcon(
                                  AssetImage("assets/icons/sapi.png"),
                                  color: Colors.blue,
                                ))));
                  }),
                  Builder(builder: (context) {
                    return Flexible(
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, Transition(HalamanSusu()));
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                          //   return HalamanSusu();
                          // }));
                        },
                        child: Container(
                            height: 70,
                            color: Colors.blue,
                            child: Icon(
                              Icons.local_drink_sharp,
                              size: 30,
                              color: Colors.white,
                            )),
                      ),
                    );
                  }),
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          height: 70,
                          color: Colors.blue,
                          child: Icon(
                            Icons.analytics,
                            size: 30,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Icon(
                            Icons.app_settings_alt_outlined,
                            size: 30,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.white, width: 5)),
            elevation: 0,
            onPressed: () {
              // Navigator.push(context, TransitionBottomToTop(HalamanDataSapi("")));
              // Navigator.of(context).push(MaterialPageRoute(builder: (context){
              //   return TambahSapi();
              // }));
            },
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.push(context, TransitionBottomToTop(TambahSapi()));
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  //   return TambahSapi();
                  // }));
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              );
            }),
          ),
          body: RefreshIndicator(
            onRefresh: refreshData,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                for (int i = dataSapi.length - 1; i > -1; i--)
                  // Text(sapi[i][0].toString()),
                  ItemDataSapi(
                      dataSapi[i][0].toString(),
                      dataSapi[i][1].toString(),
                      dataSapi[i][2].toString(),
                      dataSapi[i][3].toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemDataSapi extends StatelessWidget {
  String idSapi;
  String namaSapi;
  String tglLahirSapi;
  String kesehatanSapi;
  ItemDataSapi(
      this.idSapi, this.namaSapi, this.tglLahirSapi, this.kesehatanSapi);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
          Navigator.push(context, Transition(ProfilSapi(idSapi)));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //   return ProfilSapi(idSapi);
          // }));
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
                  CircleAvatar(
                    child: Text(idSapi),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        namaSapi,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(tglLahirSapi),
                    ],
                  ),
                ],
              ),
              if (kesehatanSapi == 'Sehat')
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      kesehatanSapi,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              else if (kesehatanSapi == 'Kurang Sehat')
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      kesehatanSapi,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                )
              else if (kesehatanSapi == 'null')
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      kesehatanSapi,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                )

              // else if(kesehatanSapi == 'Sakit')
              else
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      kesehatanSapi,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
            ],
          ),
        ),
      );
    });
  }
}
