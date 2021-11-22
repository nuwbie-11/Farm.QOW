import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Susu {
  int? idSusu;
  int? idProfilSapi;
  int? jumlahSusu;
  String? grade;
  double? fat;
  double? snf;
  double? density;
  double? lactose;
  double? solids;
  double? protein;
  int? tgl;
  int? bln;
  int? thn;

  Susu(
      {this.idSusu,
      this.idProfilSapi,
      this.jumlahSusu,
      this.grade,
      this.fat,
      this.snf,
      this.density,
      this.lactose,
      this.solids,
      this.protein,
      this.tgl,
      this.bln,
      this.thn});
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    final file = File(path + "/" + "susu.json");
    if (file.existsSync()) {
      // print(file.existsSync());
      return file;
    }
    file.create();
    return file;
  }

  Future<File> write(List<Map<String, dynamic>> jsonFile) async {
    final file = await localFile;
    if (file.existsSync()) {
      // Write the file
      return file.writeAsString(jsonEncode(jsonFile));
    }
    file.create();
    return file.writeAsString(jsonEncode(jsonFile));
  }

  factory Susu.fromJson(Map<String, dynamic> json) {
    return Susu(
        idSusu: json["idSusu"],
        idProfilSapi: json["idProfilSapi"],
        jumlahSusu: json["jumlahSusu"],
        grade: json["grade"],
        fat: json["fat"],
        snf: json["snf"],
        density: json["density"],
        lactose: json["lactose"],
        solids: json["solids"],
        protein: json["protein"],
        tgl: json["tgl"],
        bln: json["bln"],
        thn: json["thn"]);
  }

  Map<String, dynamic> toJson() => {
        "idSusu": idSusu,
        "idProfilSapi": idProfilSapi,
        "jumlahSusu": jumlahSusu,
        "grade": grade,
        "fat": fat,
        "snf": snf,
        "density": density,
        "lactose": lactose,
        "solids": solids,
        "protein": protein,
        "tgl": tgl,
        "bln": bln,
        "thn": thn,
      };
}
