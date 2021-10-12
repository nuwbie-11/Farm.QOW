import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/CheckUp/DetailCheckUp.dart';
import 'package:flutter/material.dart';



class CheckUp extends StatelessWidget {
  int idSapi;
  CheckUp(this.idSapi);
  // const CheckUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var dataCheckup = [];
    for(int i=0; i<checkup.length;i++){
      if(checkup[i][1] == idSapi){
        dataCheckup.add(checkup[i]);
      }
    }
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

                  Text('Check Up'),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          children: [

            for(int i=dataCheckup.length-1;i>-1;i--)
              ItemCheckup(idSapi,dataCheckup[i][2],dataCheckup[i][3],dataCheckup[i][4],dataCheckup[i][14],dataCheckup[i][0])
              // ItemCheckup('2', "3", "20021")
          ],
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return DetailChecUp(idCheckup);
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
