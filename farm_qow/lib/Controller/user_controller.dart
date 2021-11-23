import 'dart:convert';

import 'package:farm_qow/Model/user_model.dart';

class UserController {
  User user = User();
  static List header = [
    "nik",
    "nama",
    "tanggal Lahir",
    "tempat Lahir",
    "jenis Kelamin",
    "alamat",
    "status Kawin",
    "password",
    "isAdmin",
    "agama"
  ];
  List userContent = [];

  dynamic getDataUser() async {
    final file = await user.localFile;
    final content = await file.readAsString();
    final res = content == '' ? _loadAdmin() : jsonDecode(content);
    // List myList = await jsonToDynamic();
    // print(res);
    for (var item in res) {
      userContent.add([
        item["nik"],
        item["nama"],
        item["tanggal Lahir"],
        item["tempat Lahir"],
        item["jenis Kelamin"],
        item["alamat"],
        item["status Kawin"],
        item["password"],
        item["isAdmin"],
        item["agama"],
      ]);
    }
    // print(sapiContent);
    return userContent;
  }

  void simpan(currentSapi) {
    List<Map<String, dynamic>> items = [];
    for (var item in currentSapi) {
      User userC = User(
        nik: item['nik'],
        nama: item['nama'],
        tanggalLahir: item["tanggal Lahir"],
        tempatLahir: item["tempat Lahir"],
        jenisKelamin: item["jenis Kelamin"],
        alamat: item["alamat"],
        statusKawin: item["status Kawin"],
        password: item["password"],
        isAdmin: item["isAdmin"],
        agama: item["agama"],
      );
      items.add(userC.toJson());
    }
    // print(items);

    user.write(items);
  }

  dynamic _loadAdmin() {
    List admin = [
      {
        "nik": "3510161111000000",
        "nama": "Abdul",
        "tanggal Lahir": "1 Januari 1976",
        "tempat Lahir": "Jember",
        "jenis Kelamin": "Laki-Laki",
        "alamat": "Jl. Abdurrohman no.3a",
        "status Kawin": "Kawin",
        "password": "admin123",
        "isAdmin": true,
        "agama": "Islam"
      }
    ];
    simpan(admin);
    return admin;
  }
}
