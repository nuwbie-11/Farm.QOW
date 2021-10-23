import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Profil%20Sapi/profilSapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var data_input = [
  0,3,
  DateTime.now().day,
  DateTime.now().month,
  DateTime.now().year,
  1,
  0,
  0,
  0,
  "",
  "",
  "",
  "",
  "","",
];



class InputCheckup extends StatefulWidget {
  int idSapi;
  InputCheckup(this.idSapi);

  List<DropdownMenuItem> nafsuMakan = [
    DropdownMenuItem(child: Text("Baik"),value: "Baik"),
    DropdownMenuItem(child: Text("Cukup"),value: "Cukup"),
    DropdownMenuItem(child: Text("Kurang"),value: "Kurang"),
  ];

  @override
  State<InputCheckup> createState() => _InputCheckupState();
}

class _InputCheckupState extends State<InputCheckup> {
  String nafsuMakanValue = "Baik";
  TextEditingController beratInput = new TextEditingController();

  TextEditingController denyutNadiInput = new TextEditingController();

  TextEditingController suhuBadanInput = new TextEditingController();

  TextEditingController nafsuMakanInput = new TextEditingController();

  TextEditingController aktifTanggapInput = new TextEditingController();

  TextEditingController gerakTubuhInput = new TextEditingController();

  TextEditingController warnaFesesInput = new TextEditingController();

  TextEditingController bauFesesInput = new TextEditingController();

  TextEditingController texturFesesInput = new TextEditingController();



  @override
  Widget build(BuildContext context) {

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

                  Text('Input Check Up'),
                ],
              ),
            ],
          ),
        ),

        body: ListView(
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),

                child: Row(
                  children: [
                    Text("nomor sapi : "+widget.idSapi.toString(),style: TextStyle(fontSize:20),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: TextField(
                // keyboardType: TextInputType.phone,
                // textAlign: TextAlign.center,
                // controller: beratInput,
                // onChanged: (ValueKey) {
                //   data_input[6] = ValueKey;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kesehatan Sapi",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: TextField(
                keyboardType: TextInputType.phone,
                // textAlign: TextAlign.center,
                controller: beratInput,
                onChanged: (ValueKey) {
                  data_input[6] = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Berat Sapi",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: TextField(
                keyboardType: TextInputType.phone,
                // textAlign: TextAlign.center,
                controller: suhuBadanInput,
                onChanged: (ValueKey) {
                  data_input[7] = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Suhu Badan",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: TextField(
                keyboardType: TextInputType.phone,
                // textAlign: TextAlign.center,
                controller: denyutNadiInput,
                onChanged: (ValueKey) {
                  data_input[8] = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Denyut Nadi",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: aktifTanggapInput,
                onChanged: (ValueKey) {
                  data_input[9] = ValueKey;
                  // usernameInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nafsu Makan",
                ),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
            //
            //   child: Row(
            //     children: [
            //       Text("Nafsu Makan",style: TextStyle(fontSize: 20),),
            //       SizedBox(width: 30,),
            //       NafsuMakan(),
            //     ],
            //   )
            // ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: aktifTanggapInput,
                onChanged: (ValueKey) {
                  data_input[10] = ValueKey;
                  // usernameInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Aktif dan Tanggap",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: gerakTubuhInput,
                onChanged: (ValueKey) {
                  data_input[11] = ValueKey;
                  // usernameInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Gerak Tubuh",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: warnaFesesInput,
                onChanged: (ValueKey) {
                  data_input[12] = ValueKey;
                  // usernameInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Warna Feses",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: bauFesesInput,
                onChanged: (ValueKey) {
                  data_input[13] = ValueKey;

                  // usernameInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Bau Feses",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: TextField(
                // textAlign: TextAlign.center,
                controller: texturFesesInput,
                onChanged: (ValueKey) {
                  data_input[14] = ValueKey;
                  // usernameInput = ValueKey;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Texture Feses",
                ),
              ),
            ),

            InkWell(
              onTap: (){
                bool isValidate = true;
                for(int i=0; i<data_input.length;i++){

                  if(data_input[i] == ""){
                    isValidate = false;
                  }
                }
                if(isValidate == true){
                  var lastIdCheckup = checkup[checkup.length-1][0];
                  print(lastIdCheckup);
                  int idCheckup = int.parse(lastIdCheckup.toString());
                  idCheckup +=1;
                  data_input[0] = idCheckup;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Data Input Checkup"),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Berat : "+data_input[6].toString()),SizedBox(height:10),
                              Text("Suhu : "+data_input[7].toString()),SizedBox(height:10),
                              Text("Denyut Nadi : "+data_input[8].toString()),SizedBox(height:10),
                              Text("Nafsu Makan : "+data_input[9].toString()),SizedBox(height:10),
                              Text("Aktif dan Tanggap : "+data_input[10].toString()),SizedBox(height:10),
                              Text("Gerak Tubuh : "+data_input[11].toString()),SizedBox(height:10),
                              Text("Warna Feses : "+data_input[12].toString()),SizedBox(height:10),
                              Text("Bau Feses : "+data_input[13].toString()),SizedBox(height:10),
                              Text("Textur Feses : "+data_input[14].toString()),SizedBox(height:10),




                            ],
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pop(true);

                                });
                              },
                              child: Text("No", style: TextStyle(color: Colors.blue)),
                            ),
                            FlatButton(
                              onPressed: () {
                                setState(() {
                                  checkup.add(data_input);
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                                    return ProfilSapi(widget.idSapi.toString());
                                  }));
                                });
                              },
                              child: Text("Yes", style: TextStyle(color: Colors.blue)),
                            )
                          ],
                        );
                      }).then((value) => null);
                  print(data_input);
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
    );
  }
}












class NafsuMakan extends StatefulWidget {
  const NafsuMakan({Key? key}) : super(key: key);

  @override
  State<NafsuMakan> createState() => NafsuMakanState();
}

/// This is the private State class that goes with NafsuMakan.
class NafsuMakanState extends State<NafsuMakan> {
  String dropdownValue = 'Baik';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      iconSize: 24,
      elevation: 2,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          // print(newValue);
          data_input[9] = newValue.toString();
          dropdownValue = newValue!;
        });
      },
      items: <String>['Baik', 'Cukup', 'Kurang']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(fontSize: 18),),
        );
      }).toList(),
    );
  }
}

/// This is the private State class that goes with NafsuMakan.
class AktifTanggap extends State<NafsuMakan> {
  String dropdownValue = 'Tanggap';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      iconSize: 24,
      elevation: 2,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          // print(newValue);
          data_input[10] = newValue.toString();
          dropdownValue = newValue!;
        });
      },
      items: <String>['Tanggap', 'Cukup', 'Kurang Tanggap']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(fontSize: 18),),
        );
      }).toList(),
    );
  }
}

