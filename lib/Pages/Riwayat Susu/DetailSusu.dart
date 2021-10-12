import 'package:farm_qow/Model/model.dart';
import 'package:flutter/material.dart';

class DetailSusu extends StatelessWidget {
  // const DetailSusu({Key? key}) : super(key: key);
  int idRiwayatSusu;
  DetailSusu(this.idRiwayatSusu);

  @override
  Widget build(BuildContext context) {
    var dataSusu;
    for(int i=0; i<susu.length;i++){
      if(susu[i][0] == idRiwayatSusu ){
        dataSusu = (susu[i]);
        break;
        // break;
      }
    }
    print("ini data susu");
    print(dataSusu);
    print("ini data susu");
    return MaterialApp(
      home: Scaffold(
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

                  Text('Detail Riwayat Susu'),
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
                    for(int i=0; i<dataSusu.length;i++)

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
                                    child: Text(susu[0][i].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  )
                              ),
                              Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    // color: Colors.blue,
                                    child: Text( ":  " +dataSusu[i].toString(),style: TextStyle(fontSize: 18),),
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
    );
  }
}
