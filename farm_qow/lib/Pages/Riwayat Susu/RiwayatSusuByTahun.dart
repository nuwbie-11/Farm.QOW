import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Riwayat%20Susu/RiwayatSusuByBulan.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'DetailSusu.dart';
import 'RiwayatSusu.dart';

class RiwayatSusuByTahun extends StatefulWidget {
  int idSapi;
  int tahun;
  RiwayatSusuByTahun(this.idSapi,this.tahun);

  @override
  _RiwayatSusuByTahunState createState() => _RiwayatSusuByTahunState();
}

class _RiwayatSusuByTahunState extends State<RiwayatSusuByTahun> {
  @override
  Widget build(BuildContext context) {
    var dataSusu = [];
    for(int i=0; i<susu.length;i++){
      if(susu[i][1] == widget.idSapi && susu[i][12] == widget.tahun){
        dataSusu.add(susu[i]);
      }
    }
    print("result");
    for(int i=0; i<dataSusu.length; i++){
      print(dataSusu[i]);
    }
    print("result");
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
                  MonthFilterAll(widget.idSapi,widget.tahun),
                  for(int i=1;i<=12;i++)
                    MonthFilter(widget.idSapi,i,widget.tahun)
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

                    Text('Riwayat Susu | '+widget.tahun.toString()),
                  ],
                ),
              ],
            ),
          ),

          body: ListView(
            children: [

              for(int i=dataSusu.length-1;i>-1;i--)
                ItemSusu(widget.idSapi,dataSusu[i][10],dataSusu[i][11],dataSusu[i][12],dataSusu[i][3],dataSusu[i][0])
              // ItemCheckup('2', "3", "20021")
            ],
          ),
        ),
      ),
    );
  }
}




class ItemSusu extends StatelessWidget {
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
    else if(gradeSusu == "B-"){
      bgGrade = Colors.orangeAccent;
    }
    else{
      bgGrade = Colors.redAccent;
    }
    return Builder(builder: (context){
      return InkWell(
        onTap: (){
          Navigator.push(context, Transition(DetailSusu(idRiwayatSusu)));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //   return DetailSusu(idRiwayatSusu);
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

class MonthFilter extends StatelessWidget {
  int idSapi;
  int bulan;
  int tahun;
  MonthFilter(this.idSapi,this.bulan,this.tahun);
  // const MonthFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, Transition(RiwayatSusuByBulan(idSapi, bulan,tahun)));
        // Navigator.of(context).push(MaterialPageRoute(builder: (context){
        //   return RiwayatSusuByBulan(idSapi, bulan,tahun);
        // }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 3),
        width: double.infinity,
        height: 60,
        color: Colors.white,
        child: Center(child: Text("Bulan "+bulan.toString(),style: TextStyle(fontSize: 26),),),
      ),
    );
  }
}



class MonthFilterAll extends StatelessWidget {
  int idSapi;
  int tahun;

  MonthFilterAll(this.idSapi,this.tahun);
  // const YearFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return RiwayatSusuByTahun(idSapi,tahun);
        }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 3),
        width: double.infinity,
        height: 60,
        color: Colors.white,
        child: Center(child: Text("Semua Bulan",style: TextStyle(fontSize: 26),),),
      ),
    );
  }
}