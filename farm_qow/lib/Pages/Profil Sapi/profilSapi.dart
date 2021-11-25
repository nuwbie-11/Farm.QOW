<<<<<<< HEAD
// ignore_for_file: file_names

import 'package:farm_qow/Controller/sapi_controller.dart';
import 'package:farm_qow/Model/storage.dart';
=======
import 'package:farm_qow/Model/model.dart';
>>>>>>> main
import 'package:farm_qow/Pages/CheckUp/CheckUp.dart';
import 'package:farm_qow/Pages/Edit%20Sapi/EditSapi.dart';
import 'package:farm_qow/Pages/Input%20Checkup/inputCheckup.dart';
import 'package:farm_qow/Pages/Input%20Susu/InputSusu.dart';
<<<<<<< HEAD
import 'package:farm_qow/Pages/MainPage/Data%20Sapi/dataSapi.dart';
=======
>>>>>>> main
import 'package:farm_qow/Pages/MainPage/MainPage.dart';
import 'package:farm_qow/Pages/Riwayat%20Susu/RiwayatSusu.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ProfilSapi extends StatefulWidget {
  String idSapi;
  // String namaSapi;
  // String tglLahirSapi;
  // String kesehatanSapi;
  ProfilSapi(this.idSapi);

  @override
  _ProfilSapiState createState() => _ProfilSapiState();
}

class _ProfilSapiState extends State<ProfilSapi> {
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

  @override
  Widget build(BuildContext context) {
    var profilSapi;
    var intIdSapi = int.parse(widget.idSapi);
    for (int i = 0; i < sapi.length; i++) {
      print(sapi[i][0]);
      print(widget.idSapi);
      if (sapi[i][0] == intIdSapi) {
        profilSapi = sapi[i];
        break;
      }

=======
  @override
  Widget build(BuildContext context) {
    var profilSapi;
    var intIdSapi = int.parse(widget.idSapi);
    for(int i=0;i<sapi.length;i++){
      print(sapi[i][0]);
      print(widget.idSapi);
      if(sapi[i][0] == intIdSapi){
        profilSapi = sapi[i];
        break;
      }

>>>>>>> main
      // }
    }
    print(profilSapi);
    String namaSapi = profilSapi[1];
    String tglLahirSapi = profilSapi[2];
    String tglDatangSapi = profilSapi[3];
    String jenisSapi = profilSapi[4];
    return MaterialApp(
<<<<<<< HEAD
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
                      Navigator.pop(context);
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      //   return HalamanDataSapi("");
                      // }));
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
                  Navigator.push(
                      context, TransitionTopToBottom(EditSapi(intIdSapi)));
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  //   return EditSapi(intIdSapi);
                  // }));
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
                            "#" + widget.idSapi.toString(),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              Transition(
                                  RiwayatSusu(int.parse(widget.idSapi))));
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          //   return RiwayatSusu(int.parse(widget.idSapi));
                          // }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          width: 170,
                          height: 170,
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              "Riwayat Pemerahan Susu",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                              ),
=======
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg/bg5.jpg",),
                fit: BoxFit.cover
            )
        ),
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
                      onPressed: (){
                        Navigator.pop(context);
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                        //   return HalamanDataSapi("");
                        // }));
                      },
                      icon: Icon(Icons.arrow_back,color:Colors.white,size: 30,),
                    ),

                    Text('Farm.QOW'),
                  ],
                ),
                IconButton(
                  onPressed: (){
                    if(user_login[0] == "manager"){
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Anda Buakan Pegawai !"),
                              content: Text(""),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).pop(true);
                                    });
                                  },
                                  child: Text("Yes", style: TextStyle(color: Colors.blue)),
                                )
                              ],
                            );
                          }).then((value) => null);
                    }
                    else{
                      Navigator.push(context, TransitionTopToBottom(EditSapi(intIdSapi)));
                    }

                  },
                  icon: Icon(Icons.create_rounded,color:Colors.white),
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
                            SizedBox(width: 10,),
                            Text(namaSapi,style: TextStyle(fontSize: 35),),
                            SizedBox(width: 20,),
                            Text("#"+widget.idSapi.toString(),style: TextStyle(fontSize: 25),),
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("TGL Lahir",style: TextStyle(fontSize: 16),),
                                      Text(tglLahirSapi,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Jenis Sapi",style: TextStyle(fontSize: 16),),
                                      Text(jenisSapi,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold))
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("TGL Datang",style: TextStyle(fontSize: 16),),
                                      Text(tglDatangSapi,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, Transition(RiwayatSusu(int.parse(widget.idSapi))));
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            //   return RiwayatSusu(int.parse(widget.idSapi));
                            // }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)
>>>>>>> main
                            ),
                            width: 170,
                            height: 170,
                            padding: EdgeInsets.all(20),
                            child: Center(child: Text("Riwayat Pemerahan Susu",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,),),),
                          ),
                        ),
<<<<<<< HEAD
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              Transition(CheckUp(int.parse(widget.idSapi))));
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          //   return CheckUp(int.parse(widget.idSapi));
                          // }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          width: 170,
                          height: 170,
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              "Riwayat Check Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25),
=======

                        InkWell(
                          onTap: (){
                            Navigator.push(context, Transition(CheckUp(int.parse(widget.idSapi))));
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            //   return CheckUp(int.parse(widget.idSapi));
                            // }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)
>>>>>>> main
                            ),
                            width: 170,
                            height: 170,
                            padding: EdgeInsets.all(20),
                            child: Center(child: Text("Riwayat Check Up",textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),),
                          ),
                        ),
<<<<<<< HEAD
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              Transition(InputSusu(int.parse(widget.idSapi))));
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          //   return InputSusu(int.parse(widget.idSapi));
                          // }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          width: 170,
                          height: 170,
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              "Input Data Pemerahan Susu",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25),
=======
                      ],
                    ),

                    SizedBox(height: 20,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            if(user_login[0] == "manager"){
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Anda Buakan Pegawai !"),
                                      content: Text(""),
                                      actions: [
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.of(context).pop(true);
                                            });
                                          },
                                          child: Text("Yes", style: TextStyle(color: Colors.blue)),
                                        )
                                      ],
                                    );
                                  }).then((value) => null);
                            }
                            else{
                              Navigator.push(context, Transition(InputSusu(int.parse(widget.idSapi))));
                            }


                            // Navi
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)
>>>>>>> main
                            ),
                            width: 170,
                            height: 170,
                            padding: EdgeInsets.all(20),

                            child: Center(child: Text("Input Data Pemerahan Susu",textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),),
                          ),
                        ),
<<<<<<< HEAD
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context, Transition(InputCheckup(intIdSapi)));
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          //   return InputCheckup(intIdSapi);
                          // }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          width: 170,
                          height: 170,
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              "Input Data Check Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                              ),
=======

                        InkWell(
                          onTap: (){
                            if(user_login[0] == "manager"){
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Anda Buakan Pegawai !"),
                                      content: Text(""),
                                      actions: [
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.of(context).pop(true);
                                            });
                                          },
                                          child: Text("Yes", style: TextStyle(color: Colors.blue)),
                                        )
                                      ],
                                    );
                                  }).then((value) => null);
                            }
                            else{
                              Navigator.push(context, Transition(InputCheckup(intIdSapi)));
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)
>>>>>>> main
                            ),
                            width: 170,
                            height: 170,
                            padding: EdgeInsets.all(20),
                            child: Center(child: Text("Input Data Check Up",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,),),),
                          ),
                        ),
<<<<<<< HEAD
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  "Apakah anda yakin akan menghapus data tersebut ?"),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).pop(false);
                                      });
                                    },
                                    child: Text("Tidak")),
                                FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        for (int i = 0; i < sapi.length; i++) {
                                          if (sapi[i][0] == intIdSapi) {
                                            sapi.removeAt(i);
                                            SapiController().simpan(sapi);
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return MyApp(0);
                                            }));
                                            break;
                                          }
                                        }
                                      });
                                    },
                                    child: Text("Oke")),
                              ],
                            );
                          });
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
=======
                      ],
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: (){

                        if(user_login[0] == "manager"){
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Anda Buakan Pegawai !"),
                                  content: Text(""),
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pop(true);
                                        });
                                      },
                                      child: Text("Yes", style: TextStyle(color: Colors.blue)),
                                    )
                                  ],
                                );
                              }).then((value) => null);
                        }
                        else{
                          showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  content: Text("Apakah anda yakin akan menghapus data tersebut ?"),
                                  actions: [
                                    FlatButton(
                                        onPressed: (){
                                          Navigator.of(context).pop();

                                        },
                                        child: Text("Tidak")
                                    ),
                                    FlatButton(
                                        onPressed: (){
                                          setState(() {
                                            removeDataCheckup(){
                                              for(int i=0; i<checkup.length;i++){
                                                if(checkup[i][1] == intIdSapi){
                                                  checkup.removeAt(i);
                                                  removeDataCheckup();
                                                }
                                              }
                                            }

                                            removeDataSusu(){
                                              for(int i=0; i<susu.length;i++){
                                                if(susu[i][1] == intIdSapi){
                                                  susu.removeAt(i);
                                                  removeDataSusu();
                                                }
                                              }
                                            }
                                            removeDataCheckup();removeDataSusu();

                                            for(int i=0; i<sapi.length;i++){
                                              if(sapi[i][0] == intIdSapi){
                                                sapi.removeAt(i);

                                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return MyApp(0);}));
                                                // break;
                                              }
                                            }
                                          });
                                        },
                                        child: Text("Oke")
                                    ),
                                  ],
                                );
                              });
                        }





                      },
                      child: Container(
                        width: 220,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30)
>>>>>>> main
                        ),

                        child: Center(child: Text("Hapus",style: TextStyle(color: Colors.white,fontSize:20),),),
                      ),
                    ),
                  )
                ],
              ),
<<<<<<< HEAD
            ),
          ],
        ),
      ),
    ));
=======
            ],
          ),
        ),
      )
    );
>>>>>>> main
  }
}
