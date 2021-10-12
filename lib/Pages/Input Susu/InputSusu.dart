import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Data%20Sapi/dataSapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var data_input_susu = [
  "id sapi",
  "",
  "",
  "A+",
  "",
  "",
  "",
  "",
  "",
  "",
  DateTime.now().day,
  DateTime.now().month,
  DateTime.now().year,
];



class InputSusu extends StatefulWidget {
  int idSapi;
  InputSusu(this.idSapi);

  @override
  State<InputSusu> createState() => _InputSusuState();
}

class _InputSusuState extends State<InputSusu> {
  TextEditingController jumlahSusuInput = new TextEditingController();
  TextEditingController fatInput = new TextEditingController();
  TextEditingController snfInput = new TextEditingController();
  TextEditingController densityInput = new TextEditingController();
  TextEditingController laktosaInput = new TextEditingController();
  TextEditingController solidsInput = new TextEditingController();
  TextEditingController proteinInput = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    data_input_susu[1] = widget.idSapi;

    return MaterialApp(
      home: Scaffold(

        endDrawer: Container(
          padding: EdgeInsets.only(top: 40),
          width: MediaQuery.of(context).size.width-50,
          height: double.infinity,

          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage("assets/images/inputCheckup.png"))
          ),

        ),

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

                  Text('Input Data Susu'),
                ],
              ),
            ],
          ),
        ),

        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue,width: 1)
          ),
          child: ListView(
            children: [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("nomor sapi : "+widget.idSapi.toString(),style: TextStyle(fontSize:20),),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.center,
                  controller: jumlahSusuInput,
                  onChanged: (ValueKey) {
                    data_input_susu[2] = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Jumlah susu (liter)",
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.center,
                  controller: fatInput,
                  onChanged: (ValueKey) {
                    data_input_susu[4] = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Lemak",
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.center,
                  controller: snfInput,
                  onChanged: (ValueKey) {
                    data_input_susu[5] = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "SNF",
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.center,
                  controller: densityInput,
                  onChanged: (ValueKey) {
                    data_input_susu[6] = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Density",
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.center,
                  controller: laktosaInput,
                  onChanged: (ValueKey) {
                    data_input_susu[7] = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Laktosa",
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.center,
                  controller: solidsInput,
                  onChanged: (ValueKey) {
                    data_input_susu[8] = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Solids",
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.center,
                  controller: proteinInput,
                  onChanged: (ValueKey) {
                    data_input_susu[9] = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Protein",
                  ),
                ),
              ),


              InkWell(
                onTap: (){
                  bool isValidate = true;
                  for(int i=0; i<data_input_susu.length-1;i++){
                    print(data_input_susu[i]);
                    if(data_input_susu[i] == ""){

                      isValidate = false;
                    }
                  }
                  if(isValidate == true){


                    var lastIdSusu = susu[susu.length-1][0];
                    int idCheckup = int.parse(lastIdSusu.toString());
                    idCheckup +=1;
                    data_input_susu[0] = idCheckup;

                    if(double.parse(data_input_susu[4].toString()) >=4  && double.parse(data_input_susu[5].toString()) >= 7.8 && double.parse(data_input_susu[6].toString()) >= 1.027 && double.parse(data_input_susu[7].toString()) >=4 && double.parse(data_input_susu[8].toString()) >=10.8 && double.parse(data_input_susu[9].toString()) >=2.8){
                      data_input_susu[3] = "A";
                    }
                    else if(double.parse(data_input_susu[4].toString()) >=4){
                      data_input_susu[3] = "B+";
                    }
                    else if(double.parse(data_input_susu[5].toString()) >= 7.8 && double.parse(data_input_susu[6].toString()) >= 1.027 && double.parse(data_input_susu[7].toString()) >=4 && double.parse(data_input_susu[8].toString()) >=10.8 && double.parse(data_input_susu[9].toString()) >=2.8){
                      data_input_susu[3] = "B-";
                    }
                    else{
                      data_input_susu[3] = "C";
                  }


                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Data Input Checkup"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Grade : "+data_input_susu[3].toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height:10),

                                Text("id Susu : "+data_input_susu[0].toString()),SizedBox(height:10),
                                Text("id sapi : "+data_input_susu[1].toString()),SizedBox(height:10),
                                Text("tanggal : "+data_input_susu[10].toString()),SizedBox(height:10),
                                Text("bulan : "+data_input_susu[11].toString()),SizedBox(height:10),
                                Text("tahun : "+data_input_susu[12].toString()),SizedBox(height:10),
                                Text("Jumlah Susu : "+data_input_susu[2].toString()),SizedBox(height:10),

                                Text("Lemak : "+data_input_susu[4].toString()),SizedBox(height:10),
                                Text("SNF : "+data_input_susu[5].toString()),SizedBox(height:10),
                                Text("Density : "+data_input_susu[6].toString()),SizedBox(height:10),
                                Text("Laktosa : "+data_input_susu[7].toString()),SizedBox(height:10),
                                Text("Solids : "+data_input_susu[8].toString()),SizedBox(height:10),
                                Text("Protein : "+data_input_susu[9].toString()),SizedBox(height:10),





                              ],
                            ),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop();

                                  });
                                },
                                child: Text("No", style: TextStyle(color: Colors.blue)),
                              ),
                              FlatButton(
                                onPressed: () {



                                  susu.add(data_input_susu);
                                  print("result");
                                  for(int i=0;i<susu.length;i++){
                                    print(susu[i]);
                                  }
                                  print("result");
                                  data_input_susu = [
                                    "id sapi",
                                    "",
                                    "",
                                    "A+",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    DateTime.now().day,
                                    DateTime.now().month,
                                    DateTime.now().year,
                                  ];

                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                                    return HalamanDataSapi();
                                  }));
                                },
                                child: Text("Yes", style: TextStyle(color: Colors.blue)),
                              )
                            ],
                          );
                        });
                  }
                  else{
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Confirm"),
                            content: Text("Data tidak boleh kosong"),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop(true);
                                  });
                                },
                                child: Text("Yes", style: TextStyle(color: Colors.blue)),
                              )
                            ],
                          );
                        }).then((value) => null);
                  }

                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  // width: 150,
                  height: 40,
                  color: Colors.blue,
                  child: Center(child: Text("Simpan",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}