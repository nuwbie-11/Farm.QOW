import 'dart:convert';
import 'dart:io';

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
    "thn"
  ];

  List susuContent = [];

  dynamic getDataSusu() async {
    final file = await susu.localFile;
    final content = await file.readAsString();
    final res = content == '' ? [] : jsonDecode(content);
    for (var item in res) {
      susuContent.add([
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
        item["thn"]
      ]);
    }
    // print(sapiContent);
    return susuContent;
  }

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
          thn: int.parse(item[12].toString()));

      items.add(sus.toJson());
    }
    // print(items);
    susu.write(items);
  }
}
