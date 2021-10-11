import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Profil%20Sapi/profilSapi.dart';
import 'package:farm_qow/Pages/Tambah%20Sapi/TambahSapi.dart';
import 'package:flutter/material.dart';

class HalamanDataSapi extends StatelessWidget {
  const HalamanDataSapi ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          title: Row(
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

        bottomNavigationBar: Container(
          width: double.infinity,
          color: Colors.blue,
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
                      color: Colors.white,
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
                      color: Colors.blue,
                      child: Icon(Icons.app_settings_alt_outlined ,size: 30,color: Colors.white,)
                  ),
                ),
              ),
            ],
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
            for(int i=0;i<sapi.length;i++)
              ItemDataSapi(
                  sapi[i][0].toString(),
                  sapi[i][1].toString(),
                  sapi[i][3].toString(),
                  sapi[i][4].toString()
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
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          // shape: RoundedRectangleBorder(
          //   side: BorderSide(width: 1,color: Colors.black)
          // ),
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 70,
            color: Colors.white,
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
        ),
      );
    });
  }
}
