import 'dart:convert';
<<<<<<< HEAD

import 'package:farm_qow/Model/storage.dart';
import 'package:farm_qow/Model/susu_model.dart';

class SusuController {
  Susu susu = Susu();
  static List header = [
    "idSusu",
    "idProfilSapi",
    "Jumlah Susu",
    "Grade",
    "Fat",
    "SNF",
    "Density ",
    "Lactose",
    "Solids",
    "Protein",
    "tgl",
    "bln",
    "thn",
    "petugas"
  ];

  List susuContent = [];

  dynamic getDataSusu() async {
    final file = await susu.localFile;
    final content = await file.readAsString();
    final res = content == '' ? [] : jsonDecode(content);
    for (var item in res) {
      susuContent.add([
=======
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class SusuController {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    final file = File(path + "/" + "susu.json");
    return file;
  }

  Future<String> jsonAsString() async {
    try {
      final file = await _localFile;
      final content = await file.readAsString();
      return content;
    } catch (e) {
      print(e);
    }
    return '[]';
  }

  Future<File> writeJson(List<Map<String, dynamic>> jsonFile) async {
    final file = await _localFile;
    if (file.existsSync()) {
      // Write the file
      print("object");
      return file.writeAsString(jsonEncode(jsonFile));
    }
    print(file.existsSync());
    file.create();
    return file.writeAsString(jsonEncode(jsonFile));
  }

  dynamic jsonToDynamic() {
    dynamic res = jsonAsString().then((result) {
      // print("from whole : $result");
      final res = jsonDecode(result);
      return res;
    });
    return res;
  }

  List susuContent = [];

  dynamic fetch2List() async {
    List myList = await jsonToDynamic();
    for (var item in myList) {
      this.susuContent.add([
>>>>>>> main
        item["idSusu"],
        item["idProfilSapi"],
        item["jumlahSusu"],
        item["grade"],
        item["fat"],
        item["snf"],
        item["density"],
        item["lactose"],
        item["solids"],
        item["protein"],
        item["tgl"],
        item["bln"],
<<<<<<< HEAD
        item["thn"],
        item["petugas"]
=======
        item["thn"]
>>>>>>> main
      ]);
    }
    // print(sapiContent);
    return susuContent;
  }
<<<<<<< HEAD

  void simpan(current) {
    List<Map<String, dynamic>> items = [];
    for (var item in current) {
      Susu sus = Susu(
          idSusu: int.parse(item[0].toString()),
          idProfilSapi: int.parse(item[1].toString()),
          jumlahSusu: int.parse(item[2].toString()),
          grade: (item[3].toString()),
          fat: double.parse(item[4].toString()),
          snf: double.parse(item[5].toString()),
          density: double.parse(item[6].toString()),
          lactose: double.parse(item[7].toString()),
          solids: double.parse(item[8].toString()),
          protein: double.parse(item[9].toString()),
          tgl: int.parse(item[10].toString()),
          bln: int.parse(item[11].toString()),
          thn: int.parse(item[12].toString()),
          petugas: item[13]);

      items.add(sus.toJson());
    }
    // print(items);
    susu.write(items);
  }

  dynamic populateUser() {
    List ps = [];
    for (var item in susus) {
      // var temp = {
      //   "nik": item[0],
      //   "nama": item[1],
      //   "tanggal Lahir": item[2],
      //   "tempat Lahir": item[3],
      //   "jenis Kelamin": item[4],
      //   "alamat": item[5],
      //   "status Kawin": item[6],
      //   "password": item[7],
      //   "isAdmin": item[8],
      //   "agama": item[9]
      // };
      // print("Value is : $temp");
      ps.add(item);
    }
    simpan(ps);
    return ps;
  }
=======
>>>>>>> main
}
