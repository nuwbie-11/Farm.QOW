// ignore_for_file: file_names

import 'package:farm_qow/Controller/checkup_controller.dart';
import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Sapi/profil_selected_sapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputCheckup extends StatefulWidget {
  int idSapi;
  final Map<String, dynamic> content;
  InputCheckup(this.idSapi, {required this.content});

  @override
  State<InputCheckup> createState() => _InputCheckupState();
}

class _InputCheckupState extends State<InputCheckup> {
  TextEditingController beratInput = new TextEditingController();

<<<<<<< Updated upstream
  TextEditingController denyutNadiInput = new TextEditingController();
=======
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
          endDrawer: Container(
            padding: EdgeInsets.only(top: 40),
            width: MediaQuery.of(context).size.width - 50,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/images/inputCheckup.png"))),
          ),
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
                    Text('Input Check Up'),
                  ],
                ),
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
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "nomor sapi : " + widget.idSapi.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Diagnosa Dokter",
                          style: TextStyle(fontSize: 20),
                        ),
                        Kesehatan(),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    // textAlign: TextAlign.center,
                    controller: beratInput,
                    onChanged: (ValueKey) {
                      data_input[5] = ValueKey;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Berat Sapi(Kg)",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    // textAlign: TextAlign.center,
                    controller: suhuBadanInput,
                    onChanged: (ValueKey) {
                      data_input[6] = ValueKey;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Suhu Badan(celcius)",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    // textAlign: TextAlign.center,
                    controller: denyutNadiInput,
                    onChanged: (ValueKey) {
                      data_input[7] = ValueKey;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Denyut Nadi(BPM)",
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nafsu Makan",
                          style: TextStyle(fontSize: 20),
                        ),
                        NafsuMakan(),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Aktif Tanggap",
                          style: TextStyle(fontSize: 20),
                        ),
                        AktifTanggap(),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gerak Tubuh",
                          style: TextStyle(fontSize: 20),
                        ),
                        GerakTubuh(),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Warna Feses",
                          style: TextStyle(fontSize: 20),
                        ),
                        WarnaFeses(),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bau Feses",
                          style: TextStyle(fontSize: 20),
                        ),
                        BauFeses(),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Texture Feses",
                          style: TextStyle(fontSize: 20),
                        ),
                        TexsturFeses(),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  child: TextField(
                    // textAlign: TextAlign.center,
                    controller: catatanInput,
                    onChanged: (ValueKey) {
                      data_input[15] = ValueKey;
                      // usernameInput = ValueKey;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Catatan",
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    bool isValidate = true;
                    for (int i = 1; i < data_input.length - 1; i++) {
                      // print(data_input[i]);
                      if (data_input[i] == "" || data_input[i] == 0) {
                        isValidate = false;
                      }
                    }
                    if (isValidate == true) {
                      print(checkup);
                      var lastIdCheckup = checkup.length == 0
                          ? 0
                          : checkup[checkup.length - 1][0];
                      int idCheckup = int.parse(lastIdCheckup.toString());
                      idCheckup += 1;
                      data_input[0] = idCheckup;
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Apakah Data Sudah Benar?"),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("id checkup : " +
                                      data_input[0].toString()),
                                  SizedBox(height: 10),
                                  Text("id sapi : " + data_input[1].toString()),
                                  SizedBox(height: 10),
                                  Text("tanggal : " + data_input[2].toString()),
                                  SizedBox(height: 10),
                                  Text("bulan : " + data_input[3].toString()),
                                  SizedBox(height: 10),
                                  Text("tahun : " + data_input[4].toString()),
                                  SizedBox(height: 10),
                                  Text("Diagnosa Dokter : " +
                                      data_input[14].toString()),
                                  SizedBox(height: 10),
                                  Text("Berat : " +
                                      data_input[5].toString() +
                                      " Kg"),
                                  SizedBox(height: 10),
                                  Text("Suhu : " +
                                      data_input[6].toString() +
                                      " Celcious"),
                                  SizedBox(height: 10),
                                  Text("Denyut Nadi : " +
                                      data_input[7].toString() +
                                      " BPM"),
                                  SizedBox(height: 10),
                                  Text("Nafsu Makan : " +
                                      data_input[8].toString()),
                                  SizedBox(height: 10),
                                  Text("Aktif dan Tanggap : " +
                                      data_input[9].toString()),
                                  SizedBox(height: 10),
                                  Text("Gerak Tubuh : " +
                                      data_input[10].toString()),
                                  SizedBox(height: 10),
                                  Text("Warna Feses : " +
                                      data_input[11].toString()),
                                  SizedBox(height: 10),
                                  Text("Bau Feses : " +
                                      data_input[12].toString()),
                                  SizedBox(height: 10),
                                  Text("Textur Feses : " +
                                      data_input[13].toString()),
                                  SizedBox(height: 10),
                                  Text(
                                      "Catatan : " + data_input[15].toString()),
                                  SizedBox(height: 10),
                                ],
                              ),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).pop(true);
                                    });
                                  },
                                  child: Text("Kembali",
                                      style: TextStyle(color: Colors.blue)),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    checkup.add(data_input);
                                    mod.write(checkup);
                                    print("result");
                                    for (int i = 0; i < checkup.length; i++) {
                                      print(checkup[i]);
                                    }
                                    print("result");
                                    data_input = [
                                      0,
                                      3,
                                      DateTime.now().day,
                                      DateTime.now().month,
                                      DateTime.now().year,
                                      0,
                                      0,
                                      0,
                                      "Baik",
                                      "Tanggap",
                                      "Normal",
                                      "Hijau Pucat",
                                      "Busuk",
                                      "Kasar",
                                      "Sehat",
                                      "tidak ada"
                                    ];
>>>>>>> Stashed changes

  TextEditingController suhuBadanInput = new TextEditingController();

  TextEditingController nafsuMakanInput = new TextEditingController();

  TextEditingController aktifTanggapInput = new TextEditingController();

  TextEditingController gerakTubuhInput = new TextEditingController();

  TextEditingController warnaFesesInput = new TextEditingController();

  TextEditingController bauFesesInput = new TextEditingController();

  TextEditingController texturFesesInput = new TextEditingController();

  List<Map<String, dynamic>> jsonFile = [];
  CheckUpController cekup = CheckUpController();

  @override
  void initState() {
    super.initState();
    readWholeJson();
  }

  void reset() {
    cekup.resetWrite([]);
  }

  void readWholeJson() {
    cekup.jsonToDynamic().then((result) {
      for (var item in result) {
        setState(() {
          jsonFile.add(item);
        });
      }
    });
    print(jsonFile);
  }

  void _getInputs() {
    final berat = int.parse(beratInput.text);
    final denyutNadi = denyutNadiInput.text;
    final suhuBadan = suhuBadanInput.text;
    final nafsuMakan = nafsuMakanInput.text;
    final aktifTanggap = aktifTanggapInput.text;
    final gerakTubuh = gerakTubuhInput.text;
    final warnaFeses = warnaFesesInput.text;
    final bauFeses = bauFesesInput.text;
    final texturFeses = texturFesesInput.text;
    String diagnosaDokter = "Sehat";
    String catatan = "tidak ada catatan";
    cekup.addCheckUp(
        jsonFile.length + 1,
        widget.idSapi,
        diagnosaDokter,
        catatan,
        berat,
        nafsuMakan,
        aktifTanggap,
        gerakTubuh,
        warnaFeses,
        bauFeses,
        texturFeses,
        suhuBadan,
        denyutNadi,
        jsonFile);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return ProfilSapi(content: widget.content);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        endDrawer: Container(
          padding: EdgeInsets.only(top: 40),
          width: MediaQuery.of(context).size.width - 50,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/inputCheckup.png"))),
        ),
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
                  Text('Input Check Up'),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Row(
                  children: [
                    Text(
                      "nomor sapi : " + widget.idSapi.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: TextField(
                // keyboardType: TextInputType.phone,
                // textAlign: TextAlign.center,
                // controller: beratInput,
                // onChanged: (ValueKey) {
                //   data_input[6] = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kesehatan Sapi",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: TextField(
                keyboardType: TextInputType.phone,
                // textAlign: TextAlign.center,
                controller: beratInput,
                // onChanged: (ValueKey) {
                //   data_input[6] = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Berat Sapi",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: TextField(
                keyboardType: TextInputType.phone,
                // textAlign: TextAlign.center,
                controller: suhuBadanInput,
                // onChanged: (ValueKey) {
                //   data_input[7] = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Suhu Badan",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: TextField(
                keyboardType: TextInputType.phone,
                // textAlign: TextAlign.center,
                controller: denyutNadiInput,
                // onChanged: (ValueKey) {
                //   data_input[8] = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Denyut Nadi",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: nafsuMakanInput,
                // onChanged: (ValueKey) {
                //   data_input[9] = ValueKey;
                //   // usernameInput = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nafsu Makan",
                ),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
            //
            //   child: Row(
            //     children: [
            //       Text("Nafsu Makan",style: TextStyle(fontSize: 20),),
            //       SizedBox(width: 30,),
            //       NafsuMakan(),
            //     ],
            //   )
            // ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: aktifTanggapInput,
                // onChanged: (ValueKey) {
                //   data_input[10] = ValueKey;
                //   // usernameInput = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Aktif dan Tanggap",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: gerakTubuhInput,
                // onChanged: (ValueKey) {
                //   data_input[11] = ValueKey;
                //   // usernameInput = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Gerak Tubuh",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: warnaFesesInput,
                // onChanged: (ValueKey) {
                //   data_input[12] = ValueKey;
                //   // usernameInput = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Warna Feses",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: bauFesesInput,
                // onChanged: (ValueKey) {
                //   data_input[13] = ValueKey;

                //   // usernameInput = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Bau Feses",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: texturFesesInput,
                // onChanged: (ValueKey) {
                //   data_input[14] = ValueKey;
                //   // usernameInput = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Texture Feses",
                ),
              ),
            ),

            InkWell(
              onTap: () {
                // reset;
                bool isValidate = true;
                if (isValidate == true) {
                  var lastIdCheckup = checkup[checkup.length - 1][0];
                  int idCheckup = int.parse(lastIdCheckup.toString());
                  idCheckup += 1;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Data Input Checkup"),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Berat : " + beratInput.text),
                              SizedBox(height: 10),
                              Text("Suhu : " + suhuBadanInput.text),
                              SizedBox(height: 10),
                              Text("Denyut Nadi : " + denyutNadiInput.text),
                              SizedBox(height: 10),
                              Text("Nafsu Makan : " + nafsuMakanInput.text),
                              SizedBox(height: 10),
                              Text("Aktif dan Tanggap : " +
                                  aktifTanggapInput.text),
                              SizedBox(height: 10),
                              Text("Gerak Tubuh : " + gerakTubuhInput.text),
                              SizedBox(height: 10),
                              Text("Warna Feses : " + warnaFesesInput.text),
                              SizedBox(height: 10),
                              Text("Bau Feses : " + bauFesesInput.text),
                              SizedBox(height: 10),
                              Text("Textur Feses : " + texturFesesInput.text),
                              SizedBox(height: 10),
                            ],
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pop(true);
                                });
                              },
                              child: Text("No",
                                  style: TextStyle(color: Colors.blue)),
                            ),
                            FlatButton(
                              onPressed: _getInputs,
                              child: Text("Yes",
                                  style: TextStyle(color: Colors.blue)),
                            )
                          ],
                        );
                      }).then((value) => value);
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
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
