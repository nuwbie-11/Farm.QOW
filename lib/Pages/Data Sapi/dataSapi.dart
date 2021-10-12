import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Profil%20Sapi/profilSapi.dart';
import 'package:farm_qow/Pages/Tambah%20Sapi/TambahSapi.dart';
import 'package:flutter/material.dart';

class HalamanDataSapi extends StatelessWidget {
  // const HalamanDataSapi ({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var dataSapi = [];
    for(int i=0;i<sapi.length;i++){
      int idSapi = int.parse(sapi[i][0].toString());
      String namaSapi = sapi[i][1].toString();
      String tanggalDatang = sapi[i][3].toString();
      String kesehatanSapi = "null";
      for(int j=(checkup.length)-1;j>-1;j--){
        if(checkup[j][1] == idSapi){
          kesehatanSapi = checkup[j][14].toString();
          break;
        }
      }
      dataSapi.add([idSapi,namaSapi,tanggalDatang,kesehatanSapi]);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // theme: ThemeData.dark(),
      home: Scaffold(
        endDrawer: Drawer(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 60,),
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: 20,),
                    Text("Yuk Sri",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white))
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_outlined,size: 40,),
                      Text("Logout",style: TextStyle(fontSize: 27),)
                    ],
                  ),


                )
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
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Farm.QOW'),
                Row(
                  children: [
                    Icon(Icons.search),
                  ],
                )
              ],
            ),
          ),
        ),

        bottomNavigationBar: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Container(

            
            width: double.infinity,

            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                Flexible(
                  fit:FlexFit.tight,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                        ),
                        
                        child: Icon(Icons.home ,size: 40,color: Colors.blue,)
                    ),
                  ),
                ),
                Flexible(
                  fit:FlexFit.tight,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                        height: 70,
                        color: Colors.blue,
                        child: Icon(Icons.local_drink_sharp ,size: 30,color: Colors.white,)
                    ),
                  ),
                ),
                Flexible(
                  fit:FlexFit.tight,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                        height: 70,
                        color: Colors.blue,
                        child: Icon(Icons.analytics  ,size: 30,color: Colors.white,)
                    ),
                  ),
                ),
                Flexible(
                  fit:FlexFit.tight,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                        height: 70,

                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                        ),
                        child: Icon(Icons.app_settings_alt_outlined ,size: 30,color: Colors.white,)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),


        floatingActionButton:

        FloatingActionButton(
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context){
            //   return TambahSapi();
            // }));
          },
          child:
          Builder(builder: (context){
            return IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return TambahSapi();
                }));
              },
              icon: Icon(Icons.add,color: Colors.white,size: 30,),
            );
          }),


        ),

        body: ListView(
          children: [
            SizedBox(height: 20,),
            for(int i=sapi.length-1;i>-1;i--)
              // Text(sapi[i][0].toString()),
              ItemDataSapi(
                  dataSapi[i][0].toString(),
                  dataSapi[i][1].toString(),
                  dataSapi[i][2].toString(),
                  dataSapi[i][3].toString()
              ),
          ],
        ),
      ),
    );
  }
}





class ItemDataSapi extends StatelessWidget {
  String idSapi;
  String namaSapi;
  String tglLahirSapi;
  String kesehatanSapi;
  ItemDataSapi(this.idSapi,this.namaSapi,this.tglLahirSapi,this.kesehatanSapi);


  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
      return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return ProfilSapi(idSapi);
          }));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
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
              Row(

                children: [
                  CircleAvatar(
                    child: Text(idSapi),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(namaSapi,style: TextStyle(fontSize: 20),),
                      Text(tglLahirSapi),
                    ],
                  ),
                ],
              ),

              if(kesehatanSapi == 'Sehat')

                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Center(
                    child: Text(kesehatanSapi,style: TextStyle(color: Colors.white),),
                  ),
                )

              else if(kesehatanSapi == 'Kurang Sehat')
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Center(
                    child: Text(kesehatanSapi,style: TextStyle(fontSize: 10,color: Colors.white),),
                  ),
                )

              else if(kesehatanSapi == 'null')
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)
                    ),

                    child: Center(
                      child: Text(kesehatanSapi,style: TextStyle(fontSize: 18,color: Colors.white),),
                    ),
                  )

              // else if(kesehatanSapi == 'Sakit')
              else
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)
                    ),

                    child: Center(
                      child: Text(kesehatanSapi,style: TextStyle(color: Colors.white),),
                    ),
                  )


            ],
          ),
        ),
      );
    });
  }
}
