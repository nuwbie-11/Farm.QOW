import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Riwayat%20Susu/DetailSusu.dart';
import 'package:flutter/material.dart';

class RiwayatSusu extends StatelessWidget {
  int idSapi;
  RiwayatSusu(this.idSapi);
  // const RiwayatSusu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataSusu = [];
    for(int i=0; i<susu.length;i++){
      if(susu[i][1] == idSapi){
        dataSusu.add(susu[i]);
      }
    }
    print("result");
    for(int i=0; i<dataSusu.length; i++){
      print(dataSusu[i]);
    }
    print("result");
    return MaterialApp(
      home: Scaffold(
        endDrawer: Drawer(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.blue,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: Center(child: Text("2021",style: TextStyle(fontSize: 26),),),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: Center(child: Text("2020",style: TextStyle(fontSize: 26),),),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: Center(child: Text("2019",style: TextStyle(fontSize: 26),),),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
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

                  Text('Riwayat Susu'),
                ],
              ),
            ],
          ),
        ),

        body: ListView(
          children: [

            for(int i=dataSusu.length-1;i>-1;i--)
              ItemSusu(idSapi,dataSusu[i][10],dataSusu[i][11],dataSusu[i][12],dataSusu[i][3],dataSusu[i][0])
            // ItemCheckup('2', "3", "20021")
          ],
        ),
      ),
    );
  }
}




class ItemSusu extends StatelessWidget {
  // const ItemSusu({Key? key}) : super(key: key);
  int idSapi;
  int tgl;
  int bulan;
  int tahun;
  String gradeSusu;
  int idRiwayatSusu;

  ItemSusu(this.idSapi,this.tgl,this.bulan,this.tahun,this.gradeSusu,this.idRiwayatSusu);

  @override
  Widget build(BuildContext context) {
    var bgGrade;
    if(gradeSusu == "A"){
      bgGrade = Colors.green[300];
    }
    else if(gradeSusu == "B" || gradeSusu == "B+"){
      bgGrade = Colors.blue;
    }
    else{
      bgGrade = Colors.redAccent;
    }
    return Builder(builder: (context){
      return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return DetailSusu(idRiwayatSusu);
          }));
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
                    color: bgGrade,
                    borderRadius: BorderRadius.circular(10)
                ),

                child: Center(child: Text(gradeSusu,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),),

          ),]
      )),
      );
    });
  }
}
