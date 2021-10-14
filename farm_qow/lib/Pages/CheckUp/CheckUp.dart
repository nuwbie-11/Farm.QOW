// ignore: file_names
import 'package:farm_qow/Pages/CheckUp/DetailCheckUp.dart';
import 'package:flutter/material.dart';

class CheckUp extends StatelessWidget {
  const CheckUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        endDrawer: Drawer(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.blue,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "2021",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "2020",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "2019",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
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
                  Text('Check Up'),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            // Bulan('Januari','Sehat','Kurang Sehat'),
            // Bulan('Febuari','Sakit','Sehat'),
            // Bulan('Maret','Kurang Sehat','Sakit'),
            // Bulan('April','Sehat','Sehat'),
            // Bulan('Mei','Sehat','Sakit'),
            Bulan('Oktober', 'Sehat', ''),
          ],
        ),
      ),
    );
  }
}

class Bulan extends StatelessWidget {
  // const Bulan({Key? key}) : super(key: key);
  String namaBulan;
  String checkupSatu;
  String checkupDua;

  Bulan(this.namaBulan, this.checkupSatu, this.checkupDua);

  @override
  Widget build(BuildContext context) {
    Color bg_Satu;
    Color bg_Dua;
    if (checkupSatu == 'Sehat') {
      bg_Satu = Colors.green;
    } else if (checkupSatu == 'Kurang Sehat') {
      bg_Satu = Colors.amber;
    } else {
      bg_Satu = Colors.red;
    }

    if (checkupDua == 'Sehat') {
      bg_Dua = Colors.green;
    } else if (checkupDua == 'Kurang Sehat') {
      bg_Dua = Colors.yellow;
    } else {
      bg_Dua = Colors.red;
    }

    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetailChecUp();
          }));
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                Text(
                  namaBulan,
                  style: TextStyle(fontSize: 26),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
                          color: bg_Dua,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          checkupDua,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
                          color: bg_Satu,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          checkupSatu,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
