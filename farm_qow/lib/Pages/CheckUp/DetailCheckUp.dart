// ignore_for_file: file_names

import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Model/new_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailChecUp extends StatefulWidget {
  int idCheckup;
  DetailChecUp(this.idCheckup);

  @override
  _DetailChecUpState createState() => _DetailChecUpState();
}

class _DetailChecUpState extends State<DetailChecUp> {
  List cekup = [];
  NewCheckUpModel newCekup = NewCheckUpModel();
  var mod = ModelCheckUp();

  void upCheckUp() async {
    mod.cekups = await newCekup.fetch2List();
    setState(() {
      cekup = mod.cekups;
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
    for (int i = 0; i < cekup.length; i++) {
      if (cekup[i][0] == widget.idCheckup) {
        dataCheckup = (cekup[i]);
        break;
      }
    }
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
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text('Detail Checkup'),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                  for (int i = 0; i < dataCheckup.length; i++)
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
                                  child: Text(
                                    mod.header[i].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                )),
                            Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  // color: Colors.blue,
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
          ],
        ),
      ),
    );
  }
}
