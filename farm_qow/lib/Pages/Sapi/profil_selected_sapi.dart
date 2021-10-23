// ignore_for_file: file_names

import 'package:farm_qow/Controller/sapi_controller.dart';
import 'package:farm_qow/Model/new_model.dart';
import 'package:farm_qow/Pages/CheckUp/CheckUp_page.dart';
import 'package:farm_qow/Pages/Sapi/edit_sapi.dart';
import 'package:farm_qow/Pages/Input%20Checkup/inputCheckup.dart';
import 'package:farm_qow/Pages/Sapi/sapi_landing.dart';
import 'package:flutter/material.dart';

class ProfilSapi extends StatefulWidget {
  final Map<String, dynamic> content;
  // String idSapi;
  // String namaSapi;
  // String tglLahirSapi;
  // String kesehatanSapi;
  // ProfilSapi(this.idSapi, required this.content, {Key? key}) : super(key: key);
  const ProfilSapi({Key? key, required this.content});

  @override
  State<ProfilSapi> createState() => _ProfilSapiState();
}

class _ProfilSapiState extends State<ProfilSapi> {
  List<Map<String, dynamic>> jsonFile = [];

  @override
  void initState() {
    super.initState();
    readWholeJson();
  }

  void readWholeJson() {
    SapiController().jsonToDynamic().then((result) {
      for (var item in result) {
        setState(() {
          jsonFile.add(item);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var intIdSapi = (widget.content["idProfilSapi"]);
    int fixedIndex = jsonFile.indexOf(widget.content);
    String namaSapi = widget.content["nama"];
    String tglLahirSapi = widget.content["tglLahir"];
    String tglDatangSapi = widget.content["tglDatang"];
    String kesehatanSapi = "Sehat";
    String jenisSapi = widget.content["jenisSapi"];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
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
                    Text('Farm.QOW'),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    // print(jsonFile);
                    for (var i = 0; i < jsonFile.length; i++) {
                      final current = jsonFile[i];

                      if (current["idProfilSapi"] ==
                          widget.content["idProfilSapi"]) {
                        fixedIndex = i;
                      }
                    }
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return EditSapi(
                        fixedIndex,
                        content: widget.content,
                      );
                    }));
                  },
                  icon: Icon(Icons.create_rounded, color: Colors.white),
                )
              ],
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              namaSapi,
                              style: TextStyle(fontSize: 35),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "#" + widget.content["idProfilSapi"].toString(),
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "TGL Lahir",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(tglLahirSapi,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  color: Colors.blue[300],
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Jenis Sapi",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(jenisSapi,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "TGL Datang",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(tglDatangSapi,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return CheckUp(
                                content: widget.content,
                                idProfilSapi: intIdSapi,
                              );
                            }));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              width: size.width * 0.44,
                              height: 170,
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  "Riwayat susu",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return CheckUp(
                                content: widget.content,
                                idProfilSapi: intIdSapi,
                              );
                            }));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              width: size.width * 0.44,
                              height: 170,
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  "Riwayat Check Up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              width: size.width * 0.44,
                              height: 170,
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  "Input Data susu",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return InputCheckup(intIdSapi,
                                  content: widget.content);
                            }));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              width: size.width * 0.44,
                              height: 170,
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  "Input Data Check Up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () async {
                        List newContent = [];
                        // print(jsonFile);
                        NewSapiModel sapiModel = NewSapiModel();
                        newContent = await sapiModel.fetch2List();

                        print(newContent);

                        // int index = -1;
                        // print(intIdSapi);

                        // for (var i = 0; i < jsonFile.length; i++) {
                        //   if (jsonFile[i]["idProfilSapi"] == intIdSapi) {
                        //     index = i;
                        //     break;
                        //   }
                        // }
                        // print(index);
                        // jsonFile.removeAt(index);
                        // SapiController().writeJson(jsonFile);
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (context) {
                        //   return HalamanDataSapi();
                        // }));
                      },
                      child: Container(
                        width: 220,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            "Hapus",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
