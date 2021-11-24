import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Input%20Susu/InputSusu.dart';
import 'package:farm_qow/Pages/MainPage/MainPage.dart';
import 'package:flutter/material.dart';

var thisYear = 2021;
class Laporan extends StatefulWidget {

  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  @override
  Widget build(BuildContext context) {

    var result = [
      for(int i=0;i<12;i++)
        [0,0,0,0],
    ];
    List<Susu> listSusu = [
      for (int i = 0; i < susu.length; i++)
          Susu(
            int.parse(susu[i][0].toString()),
            int.parse(susu[i][1].toString()),
            int.parse(susu[i][2].toString()),
            (susu[i][3].toString()),
            double.parse(susu[i][4].toString()),
            double.parse(susu[i][5].toString()),
            double.parse(susu[i][6].toString()),
            double.parse(susu[i][7].toString()),
            double.parse(susu[i][8].toString()),
            double.parse(susu[i][9].toString()),
            double.parse(susu[i][10].toString()),
            double.parse(susu[i][11].toString()),
            double.parse(susu[i][12].toString()),
          ),
    ];

    for(int i=0;i<12;i++){
      for(int j=0;j<listSusu.length;j++){
        if(listSusu[j].tahun == thisYear && listSusu[j].bulan == i+1 ){
          if(listSusu[j].grade == "A"){
            result[i][0] += int.parse(listSusu[j].jumlahSusu.toString());
          }
          else if(listSusu[j].grade == "B+"){
            result[i][1] += int.parse(listSusu[j].jumlahSusu.toString());
          }
          else if(listSusu[j].grade == "B-"){
            result[i][2] += int.parse(listSusu[j].jumlahSusu.toString());
          }
          else if(listSusu[j].grade == "C"){
            result[i][3] += int.parse(listSusu[j].jumlahSusu.toString());
          }
        }
      }
    }


    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        endDrawer:
        Drawer(
          child: Container(
            width: 50,
            height: 50,
            color: Color.fromRGBO(143, 197, 255, 0.95),
            child: ListView(
              children: [
                for(int i=21;i>16;i--)
                  YearFilterLaporan(int.parse("20"+i.toString()))
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
          title: Text('Laporan '+thisYear.toString()),
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            // labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            indicator : BoxDecoration(
                color: Colors.white30

            ),
            tabs: [
              Tab(
                child: Text("Chart",style: TextStyle(fontSize: 20),),
              ),
              Tab(
                  child: Text("Laporan",style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Padding(

                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for(int i=0;i<12;i++)

                        Card(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            width: double.infinity,
                            color: Colors.white,
                            height: 150,
                            // color: Colors.blue,
                            child: Row(
                              children: [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text("bulan "+(i+1).toString(),style: TextStyle(fontSize: 18),),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          // Grade A
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: [
                                                Text("  "+result[i][0].toString(),style: TextStyle(color: Colors.white),),
                                              ],
                                            ),
                                            height: 30,
                                            width: double.parse((result[i][0]*4).toString() ),
                                            color: Colors.green,

                                          ),

                                          // Grade B+
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("  "+result[i][1].toString(),style: TextStyle(color: Colors.white),),
                                              ],
                                            ),
                                            height: 30,
                                            width: double.parse((result[i][1]*4).toString() ),
                                            color: Colors.blue,
                                          ),

                                          // Grade B-
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("  "+result[i][2].toString(),style: TextStyle(color: Colors.white),),
                                              ],
                                            ),
                                            height: 30,
                                            width: double.parse((result[i][2]*4).toString() ),
                                            color: Colors.amber,
                                          ),



                                          // Grade C
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("  "+result[i][3].toString(),style: TextStyle(color: Colors.white),),
                                              ],
                                            ),
                                            height: 30,
                                            width: double.parse((result[i][3]*4).toString() ),
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
            ListView(
              children: [
                Table(
                  border: TableBorder.all(),
                  columnWidths: <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(64),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Text("Bulan",textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                        Text("Grade A",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                        Text("Grade B+",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                        Text("Grade B-",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                        Text("Grade C",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                        Text("Total",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    for(int i=0;i<12;i++)
                      TableRow(
                        children: <Widget>[
                          Text("Bulan "+(i+1).toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                          Text(result[i][0].toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                          Text(result[i][1].toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                          Text(result[i][2].toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                          Text(result[i][3].toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                          Text((result[i][0]+result[i][1]+result[i][2]+result[i][3]).toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                        ],
                      ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );

  }
}


class YearFilterLaporan extends StatelessWidget {
  // int idSapi;
  int tahun;
  YearFilterLaporan(this.tahun);
  // const YearFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        thisYear = tahun;
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
          return MyApp(2);
        }));
        // Navigator.push(context, Transition(CheckUpByYear(idSapi, int.parse(tahun))));
        // Navigator.of(context).push(MaterialPageRoute(builder: (context){
        //   return CheckUpByYear(idSapi, int.parse(tahun));
        // }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 3),
        width: double.infinity,
        height: 60,
        color: Colors.white,
        child: Center(child: Text(tahun.toString(),style: TextStyle(fontSize: 26),),),
      ),
    );
  }
}