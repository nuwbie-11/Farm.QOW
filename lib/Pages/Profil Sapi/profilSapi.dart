import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/CheckUp/CheckUp.dart';
import 'package:farm_qow/Pages/Data%20Sapi/dataSapi.dart';
import 'package:farm_qow/Pages/Edit%20Sapi/EditSapi.dart';
import 'package:farm_qow/Pages/Input%20Checkup/inputCheckup.dart';
import 'package:flutter/material.dart';

class ProfilSapi extends StatelessWidget {
  String idSapi;
  // String namaSapi;
  // String tglLahirSapi;
  // String kesehatanSapi;
  ProfilSapi(this.idSapi);


  @override
  Widget build(BuildContext context) {
    var profilSapi;
    var intIdSapi = int.parse(idSapi);
    for(int i=0;i<sapi.length;i++){
      print(sapi[i][0]);
      print(idSapi);
      if(sapi[i][0] == intIdSapi){
        profilSapi = sapi[i];
        break;
      }

      // }
    }
    print(profilSapi);
    String namaSapi = profilSapi[1];
    String tglLahirSapi = profilSapi[2];
    String tglDatangSapi = profilSapi[3];
    String kesehatanSapi = profilSapi[4];
    String jenisSapi = profilSapi[5];
    return MaterialApp(
      home: Scaffold(



        appBar: AppBar(
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

                  Text('Farm.QOW'),
                ],
              ),
              IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return EditSapi(intIdSapi);
                  }));
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
                          Text("#"+idSapi.toString(),style: TextStyle(fontSize: 25),),
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return CheckUp();
                          }));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            width: 170,
                            height: 170,
                            padding: EdgeInsets.all(20),
                            child: Center(child: Text("Riwayat susu",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.white),),),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return CheckUp();
                          }));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            width: 170,
                            height: 170,
                            padding: EdgeInsets.all(20),
                            child: Center(child: Text("Riwayat Check Up",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.white),),),
                          ),
                        ),
                      ),
                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            width: 170,
                            height: 170,
                            padding: EdgeInsets.all(20),

                            child: Center(child: Text("Input Data susu",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.white),),),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return InputCheckup(intIdSapi);
                          }));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            width: 170,
                            height: 170,
                            padding: EdgeInsets.all(20),
                            child: Center(child: Text("Input Data Check Up",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.white),),),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: (){
                      for(int i=0; i<sapi.length;i++){
                        if(sapi[i][0] == intIdSapi){
                          sapi.removeAt(i);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return HalamanDataSapi();}));
                          break;
                        }
                      }
                    },
                    child: Container(
                      width: 220,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)
                      ),

                      child: Center(child: Text("Hapus",style: TextStyle(color: Colors.white,fontSize:20),),),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
