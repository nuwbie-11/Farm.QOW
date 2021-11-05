// ignore_for_file: file_names
import 'package:farm_qow/Controller/checkup_controller.dart';
import 'package:farm_qow/Controller/sapi_controller.dart';
import 'package:farm_qow/Model/storage.dart';

import 'package:farm_qow/Pages/Profil%20Sapi/profilSapi.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class HalamanDataSapi extends StatefulWidget {
  String search;
  HalamanDataSapi(this.search);

  @override
  _HalamanDataSapiState createState() => _HalamanDataSapiState();
}

class _HalamanDataSapiState extends State<HalamanDataSapi> {
  // Model mod = Model();
  List sapi = [];

  List checkup = [];

  Future refreshData() async {
    sapi.clear();
    await Future.delayed(Duration(seconds: 2));
    upContent();
  }

  void upContent() async {
    final sapiTemp = await SapiController().getDataSapi();
    final tempCheckUp = await CheckUpController().getDataCheckUp();
    setState(() {
      sapi = sapiTemp;
      checkup = tempCheckUp;
    });
  }

  @override
  void initState() {
    super.initState();
    upContent();
  }

  @override
  Widget build(BuildContext context) {
    var dataSapi = [];
    for (int i = 0; i < sapi.length; i++) {
      int idSapi = int.parse(sapi[i][0].toString());
      String namaSapi = sapi[i][1].toString();
      String tanggalDatang = sapi[i][3].toString();
      String kesehatanSapi = "null";
      for (int j = (checkup.length) - 1; j > -1; j--) {
        if (checkup[j][1] == idSapi) {
          kesehatanSapi = checkup[j][14].toString();
          break;
        }
      }
      if (namaSapi.toLowerCase().contains(widget.search.toLowerCase()) ==
          true) {
        dataSapi.add([idSapi, namaSapi, tanggalDatang, kesehatanSapi]);
      }
    }
    return RefreshIndicator(
      onRefresh: refreshData,
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          for (int i = dataSapi.length - 1; i > -1; i--)
            // Text(sapi[i][0].toString()),
            ItemDataSapi(dataSapi[i][0].toString(), dataSapi[i][1].toString(),
                dataSapi[i][2].toString(), dataSapi[i][3].toString()),
        ],
      ),
    );
  }
}

class ItemDataSapi extends StatelessWidget {
  String idSapi;
  String namaSapi;
  String tglLahirSapi;
  String kesehatanSapi;
  ItemDataSapi(
      this.idSapi, this.namaSapi, this.tglLahirSapi, this.kesehatanSapi);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
          Navigator.push(context, Transition(ProfilSapi(idSapi)));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //   return ProfilSapi(idSapi);
          // }));
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
                      ),
                      Text(tglLahirSapi),
                    ],
                  ),
                ],
              ),
              if (kesehatanSapi == 'Sehat')
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      kesehatanSapi,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              else if (kesehatanSapi == 'null')
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      kesehatanSapi,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                )

              // else if(kesehatanSapi == 'Sakit')
              else
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      kesehatanSapi,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
            ],
          ),
        ),
      );
    });
  }
}
