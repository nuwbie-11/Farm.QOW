<<<<<<< HEAD
// ignore_for_file: file_names

import 'package:farm_qow/Controller/sapi_controller.dart';
=======
import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/MainPage/Data%20Sapi/dataSapi.dart';
>>>>>>> main
import 'package:farm_qow/Pages/MainPage/MainPage.dart';
import 'package:flutter/material.dart';

class EditSapi extends StatefulWidget {
  int idSapi;
  EditSapi(this.idSapi);

  @override
  State<EditSapi> createState() => _EditSapiState();
}

class _EditSapiState extends State<EditSapi> {
<<<<<<< HEAD
  List sapi = [];

  void upSapi() async {
    final tempSapi = await SapiController().getDataSapi();
    setState(() {
      sapi = tempSapi;
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

  var tanggalLahir = DateTime.now();
  var stringTanggalLahir = "pilih tanggal";

  var tanggalDatang = DateTime.now();
  var stringTanggalDatang = "pilih tanggal";
=======

  TextEditingController namaInput = new TextEditingController();
  TextEditingController jenisInput = new TextEditingController();


  String namaSapiBaru = "";
  String jenisSapiBaru = "";

  var tanggalLahir = DateTime.now();
  var stringTanggalLahir = "pilih tanggal";

  var tanggalDatang = DateTime.now();
  var stringTanggalDatang = "pilih tanggal";


>>>>>>> main

  @override
  Widget build(BuildContext context) {
    var namaLama;
    var jenisLama;
    var tanggalLahir;
<<<<<<< HEAD
    for (int i = 0; i < sapi.length; i++) {
      if (sapi[i][0] == widget.idSapi) {
=======
    for(int i=0;i<sapi.length;i++){
      if(sapi[i][0] == widget.idSapi ){
>>>>>>> main
        // print(sapi[i]);
        print(sapi[i][1]);
        namaLama = sapi[i][1];
        jenisLama = sapi[i][4];
        var tanggalLahir = sapi[i][2];
        break;
      }
    }

<<<<<<< HEAD
=======

>>>>>>> main
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
<<<<<<< HEAD
                image: AssetImage(
                  "assets/bg/bg5.jpg",
                ),
                fit: BoxFit.cover)),
=======
                image: AssetImage("assets/bg/bg5.jpg",),
                fit: BoxFit.cover
            )
        ),
>>>>>>> main
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            backgroundColor: Color.fromRGBO(143, 197, 255, 0.95),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
<<<<<<< HEAD
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
                    labelText: namaLama,
                  ),
                ),
              ),

              // SizedBox(height: 10,),
=======
                      onPressed: (){
                        Navigator.pop(context, true);
                      },
                      icon: Icon(Icons.arrow_back,color:Colors.white,size: 30,),
                    ),

                    Text('Edit Sapi'),
                  ],
                ),
              ],
            ),
          ),

          body: Column(
            children: [
              SizedBox(height: 20,),
>>>>>>> main
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                child: TextField(
                  // textAlign: TextAlign.center,
<<<<<<< HEAD
                  autofocus: false,
                  controller: jenisInput,
                  onChanged: (ValueKey) {
                    jenisSapiBaru = ValueKey;
=======
                  controller: namaInput,
                  autofocus: false,
                  onChanged: (ValueKey) {
                    namaSapiBaru = ValueKey;
>>>>>>> main
                  },

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
<<<<<<< HEAD
                    labelText: jenisLama,
=======
                    labelText: namaLama,
>>>>>>> main
                  ),
                ),
              ),

<<<<<<< HEAD
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
=======
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
                    labelText: jenisLama,
                  ),
                ),
              ),

              Row(
                children: [
                  SizedBox(width: 30,),
                  Text(stringTanggalLahir),
                  // Text(tanggalLahir.toString().substring(0,10)),
                  SizedBox(width: 20,),
                  OutlinedButton(
                      onPressed: (){
>>>>>>> main
                        showDatePicker(
                          context: context,
                          initialDate: tanggalLahir,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030),
<<<<<<< HEAD
                        ).then((value) {
                          // data_input[3] = stringTanggalDatang;
                          setState(() {
                            stringTanggalLahir =
                                value.toString().substring(0, 10);
=======

                        ).then((value){
                          // data_input[3] = stringTanggalDatang;
                          setState(() {

                            stringTanggalLahir = value.toString().substring(0,10);
>>>>>>> main
                            // data_input[3] = stringTanggalDatang;
                            // tanggalLahir = value;
                          });
                          // stringTanggalLahir = "halo halo";
                        });

<<<<<<< HEAD
                        ;
                      },
                      child: Text("tanggal Lahir"))
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
=======


                        ;
                      },
                      child: Text("tanggal Lahir")
                  )
                ],
              ),

              Row(
                children: [
                  SizedBox(width: 30,),
                  Text(stringTanggalDatang),
                  // Text(tanggalLahir.toString().substring(0,10)),
                  SizedBox(width: 20,),
                  OutlinedButton(
                      onPressed: (){
                        showDatePicker(
                          context: context,
                          initialDate: tanggalDatang,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030),

                        ).then((value){
                          // data_input[3] = stringTanggalDatang;
                          setState(() {

                            stringTanggalDatang = value.toString().substring(0,10);
                            // data_input[3] = stringTanggalDatang;
                            // tanggalLahir = value;
                          });
                          // stringTanggalLahir = "halo halo";
                        });



                        ;
                      },
                      child: Text("tanggal datang")
                  )
                ],
              ),



              InkWell(
                onTap: (){
>>>>>>> main
                  // print(namaSapiBaru);
                  // print(jenisSapiBaru);
                  // print(stringTanggalLahir);
                  // print(stringTanggalDatang);

<<<<<<< HEAD
                  for (int i = 0; i < sapi.length; i++) {
                    if (sapi[i][0] == widget.idSapi) {
                      print("result");
                      print(namaSapiBaru.toString() +
                          ";" +
                          jenisSapiBaru.toString() +
                          ";" +
                          stringTanggalLahir.toString() +
                          ";" +
                          stringTanggalDatang);
                      // print(sapi[i]);
                      print("result");
                      if (namaSapiBaru != "") {
                        sapi[i][1] = namaSapiBaru;
                      }
                      if (jenisSapiBaru != "") {
                        sapi[i][4] = jenisSapiBaru;
                      }
                      if (stringTanggalLahir != "pilih tanggal") {
                        sapi[i][2] = stringTanggalLahir;
                      }
                      if (stringTanggalDatang != "pilih tanggal") {
                        sapi[i][3] = stringTanggalDatang;
                      }
                      print(sapi);
                      SapiController().simpan(sapi);
=======
                  for(int i=0; i<sapi.length;i++){
                    if(sapi[i][0] == widget.idSapi){
                      print("result");
                      print(namaSapiBaru.toString()+";"+jenisSapiBaru.toString()+";"+stringTanggalLahir.toString()+";"+stringTanggalDatang);
                      // print(sapi[i]);
                      print("result");
                      if(namaSapiBaru != ""){
                        sapi[i][1] = namaSapiBaru;
                      }
                      if(jenisSapiBaru != ""){
                        sapi[i][4] = jenisSapiBaru;
                      }
                      if(stringTanggalLahir != "pilih tanggal"){
                        sapi[i][2] = stringTanggalLahir;
                      }
                      if(stringTanggalDatang != "pilih tanggal"){
                        sapi[i][3] = stringTanggalDatang;
                      }

>>>>>>> main
                      namaSapiBaru = "";
                      jenisSapiBaru = "";

                      tanggalLahir = DateTime.now();
                      stringTanggalLahir = "pilih tanggal";

                      tanggalDatang = DateTime.now();
                      stringTanggalDatang = "pilih tanggal";
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
<<<<<<< HEAD
                              content: Text(
                                  "Data Profil Sapi Baru Berhasil Dirubah"),
=======
                              content: Text("Data Profil Sapi Baru Berhasil Dirubah"),
>>>>>>> main
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    setState(() {
<<<<<<< HEAD
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return MyApp(0);
                                      }));
                                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return ProfilSapi(widget.idSapi.toString());}));
                                    });
                                  },
                                  child: Text("Oke",
                                      style: TextStyle(color: Colors.blue)),
=======
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyApp(0);}));
                                        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return ProfilSapi(widget.idSapi.toString());}));

                                    });
                                  },
                                  child: Text("Oke", style: TextStyle(color: Colors.blue)),
>>>>>>> main
                                )
                              ],
                            );
                          }).then((value) => null);
<<<<<<< HEAD
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
=======
                          break;

                    }
                  }

                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  // width: 150,
                  height: 40,
                  color: Colors.blue,
                  child: Center(child: Text("Simpan",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),),
                ),
              )


            ],
          ),

>>>>>>> main
        ),
      ),
    );
  }
}
