import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class User {
  dynamic? nik;
  dynamic? nama;
  dynamic? tanggalLahir;
  dynamic? tempatLahir;
  dynamic? jenisKelamin;
  dynamic? alamat;
  dynamic? statusKawin;
  dynamic? password;
  dynamic? isAdmin;
  dynamic? agama;

  User(
      {this.nik,
      this.nama,
      this.tanggalLahir,
      this.tempatLahir,
      this.jenisKelamin,
      this.alamat,
      this.statusKawin,
      this.password,
      this.isAdmin,
      this.agama});

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    bool isExist = false;
    final file = File(path + "/" + "user.json");

    if (file.existsSync()) {
      // print(file.existsSync());
      return file;
    }
    file.create();
    file.writeAsString("");
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

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "nama": nama,
        "tanggal Lahir": tanggalLahir,
        "tempat Lahir": tempatLahir,
        "jenis Kelamin": jenisKelamin,
        "alamat": alamat,
        "status Kawin": statusKawin,
        "password": password,
        "isAdmin": isAdmin,
        "agama": agama
      };
}
