<<<<<<< HEAD
// ignore_for_file: file_names

import 'package:farm_qow/Controller/susu_controller.dart';
=======
import 'package:farm_qow/Model/model.dart';
>>>>>>> main
import 'package:farm_qow/Pages/Riwayat%20Susu/RiwayatSusuByBulan.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'DetailSusu.dart';
import 'RiwayatSusu.dart';

class RiwayatSusuByTahun extends StatefulWidget {
  int idSapi;
  int tahun;
<<<<<<< HEAD
  RiwayatSusuByTahun(this.idSapi, this.tahun);
=======
  RiwayatSusuByTahun(this.idSapi,this.tahun);
>>>>>>> main

  @override
  _RiwayatSusuByTahunState createState() => _RiwayatSusuByTahunState();
}

class _RiwayatSusuByTahunState extends State<RiwayatSusuByTahun> {
<<<<<<< HEAD
  List susu = [];

  void upContent() async {
    final tempSusu = await SusuController().getDataSusu();
    setState(() {
      susu = tempSusu;
    });
  }

  @override
  void initState() {
    super.initState();
    upContent();
  }

  @override
  Widget build(BuildContext context) {
    var dataSusu = [];
    for (int i = 0; i < susu.length; i++) {
      if (susu[i][1] == widget.idSapi && susu[i][12] == widget.tahun) {
=======
  @override
  Widget build(BuildContext context) {
    var dataSusu = [];
    for(int i=0; i<susu.length;i++){
      if(susu[i][1] == widget.idSapi && susu[i][12] == widget.tahun){
>>>>>>> main
        dataSusu.add(susu[i]);
      }
    }
    print("result");
<<<<<<< HEAD
    for (int i = 0; i < dataSusu.length; i++) {
=======
    for(int i=0; i<dataSusu.length; i++){
>>>>>>> main
      print(dataSusu[i]);
    }
    print("result");
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
          endDrawer: Drawer(
            child: Container(
              width: 50,
              height: 50,
              color: Color.fromRGBO(143, 197, 255, 0.95),
              child: ListView(
                children: [
<<<<<<< HEAD
                  MonthFilterAll(widget.idSapi, widget.tahun),
                  for (int i = 1; i <= 12; i++)
                    MonthFilter(widget.idSapi, i, widget.tahun)
=======
                  MonthFilterAll(widget.idSapi,widget.tahun),
                  for(int i=1;i<=12;i++)
                    MonthFilter(widget.idSapi,i,widget.tahun)
>>>>>>> main
                ],
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(143, 197, 255, 0.95),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
<<<<<<< HEAD
=======

>>>>>>> main
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
                    Text('Riwayat Susu | ' + widget.tahun.toString()),
=======
                      onPressed: (){
                        Navigator.pop(context, true);
                      },
                      icon: Icon(Icons.arrow_back,color:Colors.white,size: 30,),
                    ),

                    Text('Riwayat Susu | '+widget.tahun.toString()),
>>>>>>> main
                  ],
                ),
              ],
            ),
          ),
<<<<<<< HEAD
          body: ListView(
            children: [
              for (int i = dataSusu.length - 1; i > -1; i--)
                ItemSusu(widget.idSapi, dataSusu[i][10], dataSusu[i][11],
                    dataSusu[i][12], dataSusu[i][3], dataSusu[i][0])
=======

          body: ListView(
            children: [

              for(int i=dataSusu.length-1;i>-1;i--)
                ItemSusu(widget.idSapi,dataSusu[i][10],dataSusu[i][11],dataSusu[i][12],dataSusu[i][3],dataSusu[i][0])
>>>>>>> main
              // ItemCheckup('2', "3", "20021")
            ],
          ),
        ),
      ),
    );
  }
}

<<<<<<< HEAD
=======



>>>>>>> main
class ItemSusu extends StatelessWidget {
  int idSapi;
  int tgl;
  int bulan;
  int tahun;
  String gradeSusu;
  int idRiwayatSusu;

<<<<<<< HEAD
  ItemSusu(this.idSapi, this.tgl, this.bulan, this.tahun, this.gradeSusu,
      this.idRiwayatSusu);
=======
  ItemSusu(this.idSapi,this.tgl,this.bulan,this.tahun,this.gradeSusu,this.idRiwayatSusu);
>>>>>>> main

  @override
  Widget build(BuildContext context) {
    var bgGrade;
<<<<<<< HEAD
    if (gradeSusu == "A") {
      bgGrade = Colors.green[300];
    } else if (gradeSusu == "B" || gradeSusu == "B+") {
      bgGrade = Colors.blue;
    } else if (gradeSusu == "B-") {
      bgGrade = Colors.orangeAccent;
    } else {
      bgGrade = Colors.redAccent;
    }
    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
=======
    if(gradeSusu == "A"){
      bgGrade = Colors.green[300];
    }
    else if(gradeSusu == "B" || gradeSusu == "B+"){
      bgGrade = Colors.blue;
    }
    else if(gradeSusu == "B-"){
      bgGrade = Colors.orangeAccent;
    }
    else{
      bgGrade = Colors.redAccent;
    }
    return Builder(builder: (context){
      return InkWell(
        onTap: (){
>>>>>>> main
          Navigator.push(context, Transition(DetailSusu(idRiwayatSusu)));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //   return DetailSusu(idRiwayatSusu);
          // }));
        },
        child: Container(
<<<<<<< HEAD
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
=======
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
>>>>>>> main
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
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
<<<<<<< HEAD
                  Text(
                    tgl.toString() +
                        "/".toString() +
                        bulan.toString() +
                        "/" +
                        tahun.toString(),
                    style: TextStyle(fontSize: 22),
                  ),
=======
                  Text(tgl.toString()+"/".toString()+bulan.toString()+"/"+tahun.toString(),style: TextStyle(fontSize: 22),),
>>>>>>> main
                  Container(
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                        color: bgGrade,
<<<<<<< HEAD
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        gradeSusu,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ])),
=======
                        borderRadius: BorderRadius.circular(10)
                    ),

                    child: Center(child: Text(gradeSusu,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),),

                  ),]
            )),
>>>>>>> main
      );
    });
  }
}

class MonthFilter extends StatelessWidget {
  int idSapi;
  int bulan;
  int tahun;
<<<<<<< HEAD
  MonthFilter(this.idSapi, this.bulan, this.tahun);
=======
  MonthFilter(this.idSapi,this.bulan,this.tahun);
>>>>>>> main
  // const MonthFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
<<<<<<< HEAD
      onTap: () {
        Navigator.push(
            context, Transition(RiwayatSusuByBulan(idSapi, bulan, tahun)));
=======
      onTap: (){
        Navigator.push(context, Transition(RiwayatSusuByBulan(idSapi, bulan,tahun)));
>>>>>>> main
        // Navigator.of(context).push(MaterialPageRoute(builder: (context){
        //   return RiwayatSusuByBulan(idSapi, bulan,tahun);
        // }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 3),
        width: double.infinity,
        height: 60,
        color: Colors.white,
<<<<<<< HEAD
        child: Center(
          child: Text(
            "Bulan " + bulan.toString(),
            style: TextStyle(fontSize: 26),
          ),
        ),
=======
        child: Center(child: Text("Bulan "+bulan.toString(),style: TextStyle(fontSize: 26),),),
>>>>>>> main
      ),
    );
  }
}

<<<<<<< HEAD
=======


>>>>>>> main
class MonthFilterAll extends StatelessWidget {
  int idSapi;
  int tahun;

<<<<<<< HEAD
  MonthFilterAll(this.idSapi, this.tahun);
=======
  MonthFilterAll(this.idSapi,this.tahun);
>>>>>>> main
  // const YearFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
<<<<<<< HEAD
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return RiwayatSusuByTahun(idSapi, tahun);
=======
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return RiwayatSusuByTahun(idSapi,tahun);
>>>>>>> main
        }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 3),
        width: double.infinity,
        height: 60,
        color: Colors.white,
<<<<<<< HEAD
        child: Center(
          child: Text(
            "Semua Bulan",
            style: TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }
}
=======
        child: Center(child: Text("Semua Bulan",style: TextStyle(fontSize: 26),),),
      ),
    );
  }
}
>>>>>>> main
