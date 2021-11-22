import 'package:farm_qow/Model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailChecUp extends StatefulWidget {
  int idCheckup;
  DetailChecUp(this.idCheckup);

  @override
  _DetailChecUpState createState() => _DetailChecUpState();
}

class _DetailChecUpState extends State<DetailChecUp> {
  @override
  Widget build(BuildContext context) {
    var dataCheckup;
    for(int i=0; i<checkup.length;i++){
      if(checkup[i][0] == widget.idCheckup ){
        dataCheckup = (checkup[i]);
        break;
        // break;
      }
    }
    List<String> name = ["Id Checkup","Id Sapi","tanggal checkup","bulancheckup","tahun checktup","berat","suhu tubuh","denyut nadi","nafsu makan","aktif","gerak tubuh","warna feses","bau feses","testur feses","Diagnosa Dokter","catatan"];
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

                    Text('Detail Checkup'),
                  ],
                ),
              ],
            ),
          ),

          body: ListView(
            children: [
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    for(int i=0; i<dataCheckup.length;i++)

                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  width: 20,
                                  // color: Colors.green,
                                  child: Text(name[i].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                )
                              ),
                              Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    // color: Colors.blue,
                                    child: Text( ":  " +dataCheckup[i].toString(),style: TextStyle(fontSize: 18),),
                                  )
                              ),
                            ],

                          ),
                          SizedBox(height: 10,),
                        ],
                      ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
