import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Sapi {
  int? idSapi;
  String? nama;
  String? tglDatang;
  String? tglLahir;
  String? jenisSapi;

  Sapi({this.idSapi, this.nama, this.tglDatang, this.tglLahir, this.jenisSapi});

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    final file = File(path + "/" + "sapi.json");
    if (file.existsSync()) {
      // print(file.existsSync());
      return file;
    }
    file.create();
    return file;
  }

  factory Sapi.fromJson(Map<String, dynamic> json) {
    return Sapi(
        idSapi: json['idProfilSapi'],
        nama: json["nama"],
        tglDatang: json['tglDatang'],
        tglLahir: json['tglLahir'],
        jenisSapi: json['jenisSapi']);
  }

  Map<String, dynamic> toJson() => {
        "idProfilSapi": idSapi,
        "nama": nama,
        "tglDatang": tglDatang,
        "tglLahir": tglLahir,
        "kesehatanSapi": "sehat",
        "jenisSapi": jenisSapi
      };
}
