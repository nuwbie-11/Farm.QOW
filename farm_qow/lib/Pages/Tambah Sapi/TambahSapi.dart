// ignore_for_file: file_names

import 'package:farm_qow/Controller/sapi_controller.dart';
import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Data%20Sapi/dataSapi.dart';
import 'package:flutter/material.dart';

class TambahSapi extends StatefulWidget {
  // const TambahSapi({Key? key}) : super(key: key);
  // DateTime tanggalLahir =

  @override
  State<TambahSapi> createState() => _TambahSapiState();
}

class _TambahSapiState extends State<TambahSapi> {
  TextEditingController namaInput = new TextEditingController();
  TextEditingController jenisInput = new TextEditingController();
  List<Map<String, dynamic>> jsonFile = [];
  SapiController sapi = SapiController();
  var idSapi = jsonList[jsonList.length - 1][0];

  var tanggalLahir = DateTime.now();
  var stringTanggalLahir = "pilih tanggal";

  var tanggalDatang = DateTime.now();
  var stringTanggalDatang = "pilih tanggal";

  var data_input = [0, "", "", "", "Sehat", ""];

  @override
  void initState() {
    super.initState();
    readWholeJson();
  }

  int _checkId(int currentId) {
    // currentId = 1;
    bool isExist = true;
    while (isExist) {
      for (var item in jsonFile) {
        if (item["idProfilSapi"] == currentId) {
          currentId = item["idProfilSapi"] + 1;
        }
      }
      isExist = false;
    }
    return currentId;
  }

  void readWholeJson() {
    sapi.jsonToDynamic().then((result) {
      for (var item in result) {
        setState(() {
          jsonFile.add(item);
        });
      }
    });
  }

  bool _getInputs() {
    int idProfilSapi = _checkId(1);
    String namaSapi = namaInput.text;
    String jenisSapi = jenisInput.text;
    return sapi.transactSapi(idProfilSapi, namaSapi, stringTanggalDatang,
        stringTanggalLahir, jenisSapi, jsonFile);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return HalamanDataSapi();
                      }));
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
        body: Column(
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
                  data_input[5] = ValueKey;
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

                for (int i = 0; i < data_input.length; i++) {
                  if (data_input[i] == "" || data_input[i] == "pilih tanggal") {
                    isValidate = false;
                  }
                }
                if (isValidate == true) {
                  // int num = int.parse(idSapi.toString());
                  // num += 1;
                  // data_input[0] = num;

                  // sapi.add([data_input]);
                  // print("last id =" + sapi[sapi.length-1][0].toString());
                  // print(data_input);
                  if (_getInputs()) {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return HalamanDataSapi();
                    }));
                  }
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
                                  Navigator.of(context).pop(true);
                                });
                              },
                              child: Text("Yes",
                                  style: TextStyle(color: Colors.blue)),
                            )
                          ],
                        );
                      }).then((value) => null);
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
    );
  }
}
