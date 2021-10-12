import 'package:farm_qow/Model/model.dart';
import 'package:farm_qow/Pages/Data%20Sapi/dataSapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var data_input = [
  0,3,
  DateTime.now().day,
  DateTime.now().month,
  DateTime.now().year,
  0,
  0,
  0,
  "Baik",
  "Tanggap",
  "Normal",
  "Hijau Pucat",
  "Busuk",
  "Kasar",
  "Sehat",
  "tidak ada"
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
  TextEditingController beratInput = new TextEditingController();
  TextEditingController denyutNadiInput = new TextEditingController();
  TextEditingController suhuBadanInput = new TextEditingController();
  TextEditingController catatanInput = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    data_input[1] = widget.idSapi;

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
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back,color:Colors.white,size: 30,),
                  ),

                  Text('Input Check Up'),
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

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kesehatan Sapi",style: TextStyle(fontSize: 20),),

                      Kesehatan(),
                    ],
                  )
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.center,
                  controller: beratInput,
                  onChanged: (ValueKey) {
                    data_input[5] = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Berat Sapi",
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.center,
                  controller: suhuBadanInput,
                  onChanged: (ValueKey) {
                    data_input[6] = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Suhu Badan",
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.center,
                  controller: denyutNadiInput,
                  onChanged: (ValueKey) {
                    data_input[7] = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Denyut Nadi",
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nafsu Makan",style: TextStyle(fontSize: 20),),
                    NafsuMakan(),
                  ],
                )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Aktif Tanggap",style: TextStyle(fontSize: 20),),
                      AktifTanggap(),
                    ],
                  )
              ),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gerak Tubuh",style: TextStyle(fontSize: 20),),

                      GerakTubuh(),
                    ],
                  )
              ),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Warna Feses",style: TextStyle(fontSize: 20),),

                      WarnaFeses(),
                    ],
                  )
              ),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bau Feses",style: TextStyle(fontSize: 20),),

                      BauFeses(),
                    ],
                  )
              ),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Texture Feses",style: TextStyle(fontSize: 20),),

                      TexsturFeses(),
                    ],
                  )
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: TextField(
                  // textAlign: TextAlign.center,
                  controller: catatanInput,
                  onChanged: (ValueKey) {
                    data_input[15] = ValueKey;
                    // usernameInput = ValueKey;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Catatan",
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  bool isValidate = true;
                  for(int i=0; i<data_input.length-1;i++){

                    if(data_input[i] == ""){
                      isValidate = false;
                    }
                  }
                  if(isValidate == true){
                    var lastIdCheckup = checkup[checkup.length-1][0];
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
                                Text("id checkup : "+data_input[0].toString()),SizedBox(height:10),
                                Text("id sapi : "+data_input[1].toString()),SizedBox(height:10),
                                Text("tanggal : "+data_input[2].toString()),SizedBox(height:10),
                                Text("bulan : "+data_input[3].toString()),SizedBox(height:10),
                                Text("tahun : "+data_input[4].toString()),SizedBox(height:10),


                                Text("Kesehatan Sapi : "+data_input[14].toString()),SizedBox(height:10),
                                Text("Berat : "+data_input[5].toString()),SizedBox(height:10),
                                Text("Suhu : "+data_input[6].toString()),SizedBox(height:10),
                                Text("Denyut Nadi : "+data_input[7].toString()),SizedBox(height:10),
                                Text("Nafsu Makan : "+data_input[8].toString()),SizedBox(height:10),
                                Text("Aktif dan Tanggap : "+data_input[9].toString()),SizedBox(height:10),
                                Text("Gerak Tubuh : "+data_input[10].toString()),SizedBox(height:10),
                                Text("Warna Feses : "+data_input[11].toString()),SizedBox(height:10),
                                Text("Bau Feses : "+data_input[12].toString()),SizedBox(height:10),
                                Text("Textur Feses : "+data_input[13].toString()),SizedBox(height:10),
                                Text("Catatan : "+data_input[15].toString()),SizedBox(height:10),





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


                                    checkup.add(data_input);
                                    print("result");
                                    for(int i=0;i<checkup.length;i++){
                                      print(checkup[i]);
                                    }
                                    print("result");
                                    data_input = [
                                      0,3,
                                      DateTime.now().day,
                                      DateTime.now().month,
                                      DateTime.now().year,
                                      0,
                                      0,
                                      0,
                                      "Baik",
                                      "Tanggap",
                                      "Normal",
                                      "Hijau Pucat",
                                      "Busuk",
                                      "Kasar",
                                      "Sehat",
                                      "tidak ada"
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
          data_input[8] = newValue.toString();
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

class AktifTanggap extends StatefulWidget {
  const AktifTanggap({Key? key}) : super(key: key);

  @override
  State<AktifTanggap> createState() => AktifTanggapState();
}

/// This is the private State class that goes with AktifTanggap.
class AktifTanggapState extends State<AktifTanggap> {
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
          data_input[9] = newValue.toString();
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



class GerakTubuh extends StatefulWidget {
  const GerakTubuh({Key? key}) : super(key: key);

  @override
  State<GerakTubuh> createState() => GerakTubuhState();
}

/// This is the private State class that goes with GerakTubuh.
class GerakTubuhState extends State<GerakTubuh> {
  String dropdownValue = 'Normal';

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
      items: <String>['Normal', 'Pincang', 'Tidak Bisa Berdiri']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(fontSize: 18),),
        );
      }).toList(),
    );
  }
}


class WarnaFeses extends StatefulWidget {
  const WarnaFeses({Key? key}) : super(key: key);

  @override
  State<WarnaFeses> createState() => WarnaFesesState();
}

/// This is the private State class that goes with WarnaFeses.
class WarnaFesesState extends State<WarnaFeses> {
  String dropdownValue = 'Hijau Pucat';

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
          data_input[11] = newValue.toString();
          dropdownValue = newValue!;
        });
      },
      items: <String>['Hijau Pucat','Coklat', 'Hitam Tanah']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(fontSize: 18),),
        );
      }).toList(),
    );
  }
}


class BauFeses extends StatefulWidget {
  const BauFeses({Key? key}) : super(key: key);

  @override
  State<BauFeses> createState() => BauFesesState();
}

/// This is the private State class that goes with BauFeses.
class BauFesesState extends State<BauFeses> {
  String dropdownValue = 'Busuk';

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
          data_input[12] = newValue.toString();
          dropdownValue = newValue!;
        });
      },
      items: <String>['Busuk','Agak Berbau Tanah', 'Berbau Tanah']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(fontSize: 18),),
        );
      }).toList(),
    );
  }
}




/// This is the private State class that goes with TexsturFeses.

class TexsturFeses extends StatefulWidget {
  const TexsturFeses({Key? key}) : super(key: key);

  @override
  State<TexsturFeses> createState() => TexsturFesesState();
}
class TexsturFesesState extends State<TexsturFeses> {
  String dropdownValue = 'Kasar';

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
          data_input[13] = newValue.toString();
          dropdownValue = newValue!;
        });
      },
      items: <String>['Kasar','Agak Halus', 'Sangat Halus']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(fontSize: 18),),
        );
      }).toList(),
    );
  }
}


/// This is the private State class that goes with TexsturFeses.

class Kesehatan extends StatefulWidget {
  const Kesehatan({Key? key}) : super(key: key);

  @override
  State<Kesehatan> createState() => KesehatanState();
}
class KesehatanState extends State<Kesehatan> {
  String dropdownValue = 'Sehat';

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
          data_input[14] = newValue.toString();
          dropdownValue = newValue!;
        });
      },
      items: <String>['Sehat','Kurang Sehat', 'Sakit']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(fontSize: 18),),
        );
      }).toList(),
    );
  }
}