import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/CheckUp/CheckupByYear.dart';
import 'package:farm_qow/Pages/CheckUp/DetailCheckUp.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Checkup{
  var idCheckup;
  var idSapi;
  var tanggal;
  var bulan;
  var tahun;
  var berat;
  var suhuTubuh;
  var denyutNadi;
  var nafsuMakan;
  var aktifTanggap;
  var gerakTubuh;
  var warnaFeses;
  var bauFeses;
  var texturFeses;
  var diagnosaDokter;
  var catatan;

  Checkup(this.idCheckup,this.idSapi,this.tanggal,this.bulan,this.tahun,this.berat,this.suhuTubuh,this.denyutNadi,this.nafsuMakan,this.aktifTanggap,this.gerakTubuh,this.warnaFeses,this.bauFeses,this.texturFeses,this.diagnosaDokter,this.catatan);
}



class CheckUp extends StatefulWidget {
  int idSapi;
  CheckUp(this.idSapi);

  @override
  _CheckUpState createState() => _CheckUpState();
}

class _CheckUpState extends State<CheckUp> {
  @override
  Widget build(BuildContext context) {

    var dataCheckup = [];
    for(int i=0; i<checkup.length;i++){
      if(checkup[i][1] == widget.idSapi ){
        dataCheckup.add(checkup[i]);
      }
    }

    List<Checkup> listCheckup = [
      for (int i = 0; i < dataCheckup.length; i++)
        Checkup(dataCheckup[i][0], dataCheckup[i][1], dataCheckup[i][2], dataCheckup[i][3], dataCheckup[i][4], dataCheckup[i][5], dataCheckup[i][6], dataCheckup[i][7], dataCheckup[i][8], dataCheckup[i][9], dataCheckup[i][10], dataCheckup[i][11], dataCheckup[i][12], dataCheckup[i][13], dataCheckup[i][14], dataCheckup[i][15]),
    ];

    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg/bg5.jpg",),
                fit: BoxFit.cover
            )
        ),

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
                    for(int i=21;i>16;i--)
                    YearFilter(widget.idSapi,"20"+i.toString())
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
                      onPressed: (){
                        Navigator.pop(context, true);
                      },
                      icon: Icon(Icons.arrow_back,color:Colors.white,size: 30,),
                    ),

                    Text('Check Up | Semua Waktu'),
                  ],
                ),
              ],
            ),
          ),




          body: ListView(
            children: [

              for(int i=listCheckup.length-1;i>-1;i--)
                ItemCheckup(widget.idSapi,listCheckup[i].tanggal,listCheckup[i].bulan,listCheckup[i].tahun,listCheckup[i].diagnosaDokter,listCheckup[i].idCheckup)
                // ItemCheckup('2', "3", "20021")
            ],
          ),
        ),
      ),
    );
  }
}




class ItemCheckup extends StatelessWidget {
  // const ItemCheckup({Key? key}) : super(key: key);
  int idSapi;
  int tgl;
  int bulan;
  int tahun;
  String kesehatanSapi;
  int idCheckup;

  ItemCheckup(this.idSapi,this.tgl,this.bulan,this.tahun,this.kesehatanSapi,this.idCheckup);

  @override
  Widget build(BuildContext context) {
    var bgKesehatan;
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
          Navigator.push(context, Transition(DetailChecUp(idCheckup)));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //   return DetailChecUp(idCheckup);
          // }));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
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
              Text(tgl.toString()+"/".toString()+bulan.toString()+"/"+tahun.toString(),style: TextStyle(fontSize: 22),),
              Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(
                    color: bgKesehatan,
                  borderRadius: BorderRadius.circular(10)
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(kesehatanSapi,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
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





class YearFilter extends StatelessWidget {
  int idSapi;
  String tahun;
  YearFilter(this.idSapi,this.tahun);
  // const YearFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, Transition(CheckUpByYear(idSapi, int.parse(tahun))));
        // Navigator.of(context).push(MaterialPageRoute(builder: (context){
        //   return CheckUpByYear(idSapi, int.parse(tahun));
        // }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 3),
        width: double.infinity,
        height: 60,
        color: Colors.white,
        child: Center(child: Text(tahun,style: TextStyle(fontSize: 26),),),
      ),
    );
  }
}



class YearFilterAll extends StatelessWidget {
  int idSapi;
  YearFilterAll(this.idSapi);
  // const YearFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
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
        child: Center(child: Text("All",style: TextStyle(fontSize: 26),),),
      ),
    );
  }
}
