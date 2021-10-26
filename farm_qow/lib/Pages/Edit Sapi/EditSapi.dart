// ignore_for_file: file_names

import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Model/new_model.dart';
import 'package:farm_qow/Pages/Data%20Sapi/dataSapi.dart';
import 'package:flutter/material.dart';

class EditSapi extends StatefulWidget {
  int idSapi;
  EditSapi(this.idSapi);

  @override
  State<EditSapi> createState() => _EditSapiState();
}

class _EditSapiState extends State<EditSapi> {
  List sapi = [];
  NewSapiModel newSapi = NewSapiModel();
  var mod = ModelSapi();

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

  TextEditingController namaInput = new TextEditingController();
  TextEditingController jenisInput = new TextEditingController();

  String namaSapiBaru = "";
  String jenisSapiBaru = "";
  var tanggalDatang = DateTime.now();
  var stringTanggalDatang = "pilih tanggal";

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
                      Navigator.pop(context, true);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text('Edit Sapi'),
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
                // textAlign: TextAlign.center,
                controller: namaInput,
                autofocus: false,
                onChanged: (ValueKey) {
                  namaSapiBaru = ValueKey;
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
                autofocus: false,
                controller: jenisInput,
                onChanged: (ValueKey) {
                  jenisSapiBaru = ValueKey;
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
                        // data_input[3] = stringTanggalDatang;
                        setState(() {
                          stringTanggalDatang =
                              value.toString().substring(0, 10);
                          // data_input[3] = stringTanggalDatang;
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
                // print(namaSapiBaru);
                // print(jenisSapiBaru);
                // print(stringTanggalDatang);

                for (int i = 0; i < sapi.length; i++) {
                  if (sapi[i][0] == widget.idSapi) {
                    print(sapi[i]);
                    if (namaSapiBaru != "") {
                      sapi[i][1] = namaSapiBaru;
                    }
                    if (jenisSapiBaru != "") {
                      sapi[i][4] = jenisSapiBaru;
                    }
                    if (stringTanggalDatang != "") {
                      sapi[i][3] = stringTanggalDatang;
                    }

                    // print(sapi);
                    ModelSapi mod = ModelSapi();
                    mod.write(sapi);
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return HalamanDataSapi("");
                    }));
                    break;
                  }
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                // width: 150,
                height: 40,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "Simpan",
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
