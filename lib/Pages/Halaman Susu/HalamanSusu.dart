import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Data%20Sapi/dataSapi.dart';
import 'package:farm_qow/Pages/Input%20Susu/InputSusu.dart';
import 'package:farm_qow/Pages/Profil%20Sapi/profilSapi.dart';
import 'package:farm_qow/Pages/Tambah%20Sapi/TambahSapi.dart';
import 'package:flutter/material.dart';

class HalamanSusu extends StatefulWidget {


  @override
  _HalamanSusuState createState() => _HalamanSusuState();
}

class _HalamanSusuState extends State<HalamanSusu> {
  @override
  Widget build(BuildContext context) {
    var dataSapi = [];

    for(int i=0;i<sapi.length;i++){
      var sapiValue = [0,"",""];
      int getIdSapi = int.parse(sapi[i][0].toString());
      String namaSapi = sapi[i][1].toString();

      var dataSusu = [];
      for(int i=0;i<susu.length;i++){
        if(susu[i][1] == getIdSapi && susu[i][10] == DateTime.now().day && susu[i][11] == DateTime.now().month && susu[i][12] == DateTime.now().year  ){
          dataSusu.add(susu[i][2]);
        }
      }

      sapiValue[0] = getIdSapi;
      sapiValue[1] = namaSapi;
      sapiValue[2] = dataSusu;

      print(sapiValue);
      dataSapi.add(sapiValue);


      // dataSapi
    }





    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // theme: ThemeData.dark(),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(143, 197, 255, 0.95),
                  image: DecorationImage(image: AssetImage("assets/bg/bg5.jpg"),fit: BoxFit.cover)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 60,),
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(height: 20,),
                      Text("Yuk Sri",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.blue))
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
            backgroundColor: Color.fromRGBO(143, 197, 255, 0.95),
            elevation: 0,
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
                  Builder(builder: (context){
                    return Flexible(
                        fit:FlexFit.tight,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                              return HalamanDataSapi("");
                            }));
                          },
                          child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                              ),

                              child: Icon(Icons.home ,size: 30,color: Colors.white,)
                          ),
                        )
                    );
                  }),
                  Builder(builder: (context){
                    return Flexible(
                        fit:FlexFit.tight,
                        child: Builder(builder: (builder){
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                                return HalamanSusu();
                              }));
                            },

                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,

                                ),

                                child: Icon(Icons.local_drink_sharp ,size: 40,color: Colors.blue,)
                            ),
                          );
                        })
                    );
                  }),
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


          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton:

          FloatingActionButton(

            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.white,width: 5)
            ),

            elevation: 0,

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
              for(int i=dataSapi.length-1;i>-1;i--)
              // Text(sapi[i][0].toString()),
              //   Text(dataSapi[i][0].toString()),
                // Text(dataSapi[i][1].toString()),
                // Text(dataSapi[i][2].toString()),
                ItemDataSapi(
                    dataSapi[i][0].toString(),
                    dataSapi[i][1].toString(),
                    dataSapi[i][2],
                ),
            ],
          ),
        ),
      ),
    );
  }
}





class ItemDataSapi extends StatelessWidget {
  String idSapi;
  String namaSapi;
  var dataSusu;
  ItemDataSapi(this.idSapi,this.namaSapi,this.dataSusu);


  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
      return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return InputSusu(int.parse(idSapi.toString()));
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
                      Text(namaSapi,style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ],
              ),

              if(dataSusu.length == 0)
                Text("belum diperah",style: TextStyle(fontSize: 18),)
              else
                Column(
                  children: [
                    for(int j=0; j<dataSusu.length; j++)
                      Text(dataSusu[j].toString() + " liter ",style: TextStyle(fontSize: 18),)
                  ],
                )




            ],
          ),
        ),
      );
    });
  }
}
