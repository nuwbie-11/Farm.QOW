// ignore_for_file: file_names

import 'package:farm_qow/Controller/sapi_controller.dart';
import 'package:farm_qow/Model/storage.dart';
import 'package:farm_qow/Pages/MainPage/Data%20Sapi/dataSapi.dart';
import 'package:farm_qow/Pages/MainPage/MainPage.dart';
import 'package:flutter/material.dart';

class TambahSapi extends StatefulWidget {
  @override
  State<TambahSapi> createState() => _TambahSapiState();
}

class _TambahSapiState extends State<TambahSapi> {
  List sapi = [];
  var idSapi = 0;

  void upSapi() async {
    final sapiTemp = await SapiController().getDataSapi();
    setState(() {
      sapi = sapiTemp;
      idSapi = sapi[sapi.length - 1][0];
    });
  }

  @override
  void initState() {
    super.initState();
    upSapi();

    print(idSapi);
  }

  TextEditingController namaInput = new TextEditingController();
  TextEditingController jenisInput = new TextEditingController();

  var tanggalLahir = DateTime.now();
  var stringTanggalLahir = "pilih tanggal";

  var tanggalDatang = DateTime.now();
  var stringTanggalDatang = "pilih tanggal";

  var data_input = [0, "", "", "", ""];
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                    Text('Tambah Sapi'),
                  ],
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    border: Border.all(color: Colors.blue, width: 1)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                      child: TextField(
                        controller: namaInput,
                        // textAlign: TextAlign.center,
                        autofocus: false,
                        onChanged: (ValueKey) {
                          data_input[1] = ValueKey;
                        },

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Nama Sapi",
                        ),
                      ),
                    ),

                    // SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                      child: TextField(
                        // textAlign: TextAlign.center,
                        controller: jenisInput,
                        // textAlign: TextAlign.center,
                        autofocus: false,
                        onChanged: (ValueKey) {
                          data_input[4] = ValueKey;
                        },

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Jenis Sapi",
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
                                  data_input[2] = stringTanggalLahir;
                                  // tanggalLahir = value;
                                });
                                // stringTanggalLahir = "halo halo";
                              });

                              ;
                            },
                            child: Text("tanggal lahir"))
                      ],
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(stringTanggalDatang),
                        // Text(tanggalLahir.toString().substring(0,10)),
                        SizedBox(
                          width: 20,
                        ),
                        OutlinedButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: tanggalDatang,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2030),
                              ).then((value) {
                                data_input[3] = stringTanggalDatang;
                                setState(() {
                                  stringTanggalDatang =
                                      value.toString().substring(0, 10);
                                  data_input[3] = stringTanggalDatang;
                                  // tanggalLahir = value;
                                });
                                // stringTanggalLahir = "halo halo";
                              });

                              ;
                            },
                            child: Text("tanggal datang"))
                      ],
                    ),

                    InkWell(
                      onTap: () {
                        bool isValidate = true;

                        print("result");
                        for (int i = 0; i < data_input.length; i++) {
                          if (data_input[i] == "" ||
                              data_input[i] == "pilih tanggal") {
                            isValidate = false;
                            break;
                          }
                        }
                        if (isValidate == true) {
                          int num = int.parse(idSapi.toString());
                          num += 1;
                          data_input[0] = num;
                          print(data_input);
                          if (sapi.contains(data_input) == false) {
                            sapi.add(data_input);
                            SapiController().simpan(sapi);
                          }
                          ;
                          data_input = [0, "", "", "", ""];
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                      "Data Profil Sapi Baru Berhasil Ditambahkan"),
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return MyApp(0);
                                          }));
                                          // Navigator.push(context, Transition(ProfilSapi(num.toString())));
                                        });
                                      },
                                      child: Text("Oke",
                                          style: TextStyle(color: Colors.blue)),
                                    )
                                  ],
                                );
                              }).then((value) => null);
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Confirm"),
                                  content: Text("Data tidak boleh kosong"),
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: Text("Oke",
                                          style: TextStyle(color: Colors.blue)),
                                    )
                                  ],
                                );
                              }).then((value) => null);
                        }
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        // width: 150,
                        height: 40,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            "Simpan ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
