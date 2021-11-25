<<<<<<< HEAD
// ignore_for_file: file_names

import 'package:farm_qow/Controller/checkup_controller.dart';
=======
import 'package:farm_qow/Model/model.dart';
>>>>>>> main
import 'package:farm_qow/Pages/CheckUp/DetailCheckUp.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'CheckUp.dart';

<<<<<<< HEAD
class CheckUpByYear extends StatefulWidget {
  int idSapi;
  int tahun;
  CheckUpByYear(this.idSapi, this.tahun);
=======


class CheckUpByYear extends StatefulWidget {
  int idSapi;
  int tahun;
  CheckUpByYear(this.idSapi,this.tahun);
>>>>>>> main

  @override
  _CheckUpByYearState createState() => _CheckUpByYearState();
}

class _CheckUpByYearState extends State<CheckUpByYear> {
<<<<<<< HEAD
  List checkup = [];

  void upCheckUp() async {
    final tempCheckUp = await CheckUpController().getDataCheckUp();
    setState(() {
      checkup = tempCheckUp;
    });
  }

  @override
  void initState() {
    super.initState();
    upCheckUp();
    // mod.resetWrite();
  }

  @override
  Widget build(BuildContext context) {
    var dataCheckup = [];
    for (int i = 0; i < checkup.length; i++) {
      if (checkup[i][1] == widget.idSapi && checkup[i][4] == (widget.tahun)) {
=======
  @override
  Widget build(BuildContext context) {

    var dataCheckup = [];
    for(int i=0; i<checkup.length;i++){
      if(checkup[i][1] == widget.idSapi && checkup[i][4] == (widget.tahun)){
>>>>>>> main
        dataCheckup.add(checkup[i]);
      }
    }
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
                  YearFilterAll(widget.idSapi),
<<<<<<< HEAD
                  for (int i = 21; i > 16; i--)
                    YearFilter(widget.idSapi, "20" + i.toString())
=======
                  for(int i=21;i>16;i--)
                    YearFilter(widget.idSapi,"20"+i.toString())
>>>>>>> main
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
                    Text('Check Up | ' + widget.tahun.toString()),
=======
                      onPressed: (){
                        Navigator.pop(context, true);
                      },
                      icon: Icon(Icons.arrow_back,color:Colors.white,size: 30,),
                    ),

                    Text('Check Up | '+widget.tahun.toString()),
>>>>>>> main
                  ],
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
<<<<<<< HEAD
              for (int i = dataCheckup.length - 1; i > -1; i--)
                ItemCheckup(widget.idSapi, dataCheckup[i][2], dataCheckup[i][3],
                    dataCheckup[i][4], dataCheckup[i][14], dataCheckup[i][0])
=======

              for(int i=dataCheckup.length-1;i>-1;i--)
                ItemCheckup(widget.idSapi,dataCheckup[i][2],dataCheckup[i][3],dataCheckup[i][4],dataCheckup[i][14],dataCheckup[i][0])
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
class ItemCheckup extends StatelessWidget {
  // const ItemCheckup({Key? key}) : super(key: key);
  int idSapi;
  int tgl;
  int bulan;
  int tahun;
  String kesehatanSapi;
  int idCheckup;

<<<<<<< HEAD
  ItemCheckup(this.idSapi, this.tgl, this.bulan, this.tahun, this.kesehatanSapi,
      this.idCheckup);
=======
  ItemCheckup(this.idSapi,this.tgl,this.bulan,this.tahun,this.kesehatanSapi,this.idCheckup);
>>>>>>> main

  @override
  Widget build(BuildContext context) {
    var bgKesehatan;
<<<<<<< HEAD
    if (kesehatanSapi == "Sehat") {
      bgKesehatan = Colors.green[300];
    } else if (kesehatanSapi == "Kurang Sehat") {
      bgKesehatan = Colors.yellow;
    } else {
      bgKesehatan = Colors.redAccent;
    }

    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
=======
    if(kesehatanSapi == "Sehat"){
      bgKesehatan = Colors.green[300];
    }
    else if(kesehatanSapi == "Kurang Sehat"){
      bgKesehatan = Colors.yellow;
    }
    else{
      bgKesehatan = Colors.redAccent;
    }

    return Builder(builder: (context){
      return InkWell(
        onTap: (){
>>>>>>> main
          Navigator.push(context, Transition(DetailChecUp(idCheckup)));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //   return DetailChecUp(idCheckup);
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
                    color: bgKesehatan,
<<<<<<< HEAD
                    borderRadius: BorderRadius.circular(10)),
=======
                    borderRadius: BorderRadius.circular(10)
                ),

>>>>>>> main
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
<<<<<<< HEAD
                    Text(
                      kesehatanSapi,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
=======
                    Text(kesehatanSapi,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
>>>>>>> main
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

<<<<<<< HEAD
class YearFilter extends StatelessWidget {
  int idSapi;
  String tahun;
  YearFilter(this.idSapi, this.tahun);
=======




class YearFilter extends StatelessWidget {
  int idSapi;
  String tahun;
  YearFilter(this.idSapi,this.tahun);
>>>>>>> main
  // const YearFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
<<<<<<< HEAD
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
=======
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
>>>>>>> main
          return CheckUpByYear(idSapi, int.parse(tahun));
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
            tahun,
            style: TextStyle(fontSize: 26),
          ),
        ),
=======
        child: Center(child: Text(tahun,style: TextStyle(fontSize: 26),),),
>>>>>>> main
      ),
    );
  }
}

<<<<<<< HEAD
=======

>>>>>>> main
class YearFilterAll extends StatelessWidget {
  int idSapi;
  YearFilterAll(this.idSapi);
  // const YearFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
<<<<<<< HEAD
      onTap: () {
=======
      onTap: (){
>>>>>>> main
        Navigator.push(context, Transition(CheckUp(idSapi)));
        // Navigator.of(context).push(MaterialPageRoute(builder: (context){
        //   return CheckUp(idSapi);
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
            "All",
            style: TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }
}
=======
        child: Center(child: Text("All",style: TextStyle(fontSize: 26),),),
      ),
    );
  }
}
>>>>>>> main
