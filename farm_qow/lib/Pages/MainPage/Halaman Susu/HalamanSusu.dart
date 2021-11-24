// ignore_for_file: file_names

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:farm_qow/Controller/sapi_controller.dart';
import 'package:farm_qow/Controller/susu_controller.dart';
import 'package:farm_qow/Model/storage.dart';
import '../../Input Susu/InputSusu.dart';
import 'package:farm_qow/Pages/Input%20Susu/InputSusuById.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class HalamanSusu extends StatefulWidget {
  @override
  _HalamanSusuState createState() => _HalamanSusuState();
}

class _HalamanSusuState extends State<HalamanSusu> {
  List sapi = [];

  List susu = [];

  Future refreshData() async {
    sapi.clear();
    await Future.delayed(Duration(seconds: 2));
    upContent();
  }

  void upContent() async {
    final tempSusu = await SusuController().getDataSusu();
    final tempSapi = await SapiController().getDataSapi();
    setState(() {
      sapi = tempSapi;
      susu = tempSusu;
    });
  }

  @override
  void initState() {
    super.initState();
    upContent();
    // modS.resetWrite();
  }

  @override
  Widget build(BuildContext context) {
    var dataSapi = [];
    int totalSusu = 0;
    int gradeA = 0;
    int gradeBplus = 0;
    int gradeBmin = 0;
    int gradeC = 0;

    for (int i = 0; i < sapi.length; i++) {
      var sapiValue = [0, "", ""];
      int getIdSapi = int.parse(sapi[i][0].toString());
      String namaSapi = sapi[i][1].toString();

      var dataSusu = [];
      for (int i = 0; i < susu.length; i++) {
        if (susu[i][1] == getIdSapi &&
            susu[i][10] == DateTime.now().day &&
            susu[i][11] == DateTime.now().month &&
            susu[i][12] == DateTime.now().year) {
          dataSusu.add(susu[i][2]);
          totalSusu += int.parse(susu[i][2].toString());
          if (susu[i][3] == "A") {
            gradeA += int.parse(susu[i][2].toString());
          } else if (susu[i][3] == "B+") {
            gradeBplus += int.parse(susu[i][2].toString());
          } else if (susu[i][3] == "B-") {
            gradeBmin += int.parse(susu[i][2].toString());
          } else {
            gradeC += int.parse(susu[i][2].toString());
          }
        }
      }

      sapiValue[0] = getIdSapi;
      sapiValue[1] = namaSapi;
      sapiValue[2] = dataSusu;

      print(sapiValue);
      dataSapi.add(sapiValue);
      // dataSapi
    }
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Susu : " + totalSusu.toString() + " liter",
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "Grade A : " + gradeA.toString(),
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "Grade B+ : " + gradeBplus.toString(),
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "Grade B- : " + gradeBmin.toString(),
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "Grade C : " + gradeC.toString(),
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        for (int i = dataSapi.length - 1; i > -1; i--)
          ItemDataSapi(
            dataSapi[i][0].toString(),
            dataSapi[i][1].toString(),
            dataSapi[i][2],
          ),
      ],
    );
  }
}

class ItemDataSapi extends StatelessWidget {
  String idSapi;
  String namaSapi;
  var dataSusu;
  ItemDataSapi(this.idSapi, this.namaSapi, this.dataSusu);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return InputSusu(int.parse(idSapi.toString()));
          }));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        namaSapi,
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
              if (dataSusu.length == 0)
                Text(
                  "belum diperah",
                  style: TextStyle(fontSize: 18),
                )
              else
                Column(
                  children: [
                    for (int j = 0; j < dataSusu.length; j++)
                      Text(
                        dataSusu[j].toString() + " liter ",
                        style: TextStyle(fontSize: 18),
                      )
                  ],
                )
            ],
          ),
        ),
      );
    });
  }
}
