<<<<<<< HEAD
// ignore_for_file: file_names

import 'package:farm_qow/Controller/checkup_controller.dart';
=======
import 'package:farm_qow/Model/model.dart';
>>>>>>> main
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailChecUp extends StatefulWidget {
  int idCheckup;
  DetailChecUp(this.idCheckup);

  @override
  _DetailChecUpState createState() => _DetailChecUpState();
}

class _DetailChecUpState extends State<DetailChecUp> {
<<<<<<< HEAD
  List checkup = [];

  void upCheckUp() async {
    final tempCheckUp = await CheckUpController().getDataCheckUp();
    setState(() {
      checkup = tempCheckUp;
    });
  }

  @override
  void initState() {
    super.initState();
    upCheckUp();
    // mod.resetWrite();
  }

  @override
  Widget build(BuildContext context) {
    var dataCheckup;
    for (int i = 0; i < checkup.length; i++) {
      if (checkup[i][0] == widget.idCheckup) {
=======
  @override
  Widget build(BuildContext context) {
    var dataCheckup;
    for(int i=0; i<checkup.length;i++){
      if(checkup[i][0] == widget.idCheckup ){
>>>>>>> main
        dataCheckup = (checkup[i]);
        break;
        // break;
      }
    }
    print(dataCheckup);
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
<<<<<<< HEAD
                image: AssetImage(
                  "assets/bg/bg5.jpg",
                ),
                fit: BoxFit.cover)),
=======
                image: AssetImage("assets/bg/bg5.jpg",),
                fit: BoxFit.cover
            )
        ),
>>>>>>> main
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
<<<<<<< HEAD
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
=======
                      onPressed: (){
                        Navigator.pop(context, true);
                      },
                      icon: Icon(Icons.arrow_back,color:Colors.white,size: 30,),
                    ),

>>>>>>> main
                    Text('Detail Checkup'),
                  ],
                ),
              ],
            ),
          ),
<<<<<<< HEAD
          body: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
=======

          body: ListView(
            children: [
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 20),
>>>>>>> main
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
<<<<<<< HEAD
                  children: [
                    for (int i = 0; i < dataCheckup.length; i++)
=======

                  children: [
                    for(int i=0; i<dataCheckup.length;i++)

>>>>>>> main
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
<<<<<<< HEAD
                                  fit: FlexFit.tight,
                                  child: Container(
                                    width: 20,
                                    // color: Colors.green,
                                    child: Text(
                                      CheckUpController.header[i].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  )),
=======
                                fit: FlexFit.tight,
                                child: Container(
                                  width: 20,
                                  // color: Colors.green,
                                  child: Text(checkup[0][i].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                )
                              ),
>>>>>>> main
                              Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    // color: Colors.blue,
<<<<<<< HEAD
                                    child: Text(
                                      ":  " + dataCheckup[i].toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
=======
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

>>>>>>> main
            ],
          ),
        ),
      ),
    );
  }
}
