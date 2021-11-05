import 'dart:ffi';

class Susu {
  int idSusu;
  int idProfilSapi;
  int jumlahSusu;
  String grade;
  double fat;
  double snf;
  double density;
  double lactose;
  double solids;
  double protein;
  int tgl;
  int bln;
  int thn;

  Susu(
      {required this.idSusu,
      required this.idProfilSapi,
      required this.jumlahSusu,
      required this.grade,
      required this.fat,
      required this.snf,
      required this.density,
      required this.lactose,
      required this.solids,
      required this.protein,
      required this.tgl,
      required this.bln,
      required this.thn});

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
