import 'dart:convert';

import 'package:farm_qow/Model/storage.dart';
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
    // final res = content == '' ? [] : jsonDecode(content);
    if (content == '') {
      final res = populateUser();
      return res;
    }
    final res = jsonDecode(content);
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
    return userContent;
  }

  void simpan(currentData) {
    List<Map<String, dynamic>> items = [];
    for (var item in currentData) {
      print("iterate : $item");
      User userC = User(
        nik: item[0],
        nama: item[1],
        tanggalLahir: item[2],
        tempatLahir: item[3],
        jenisKelamin: item[4],
        alamat: item[5],
        statusKawin: item[6],
        password: item[7],
        isAdmin: item[8],
        agama: item[9],
      );
      items.add(userC.toJson());
    }
    print(items);

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

  dynamic populateUser() {
    List ps = [];
    try {
      for (var item in pegawai) {
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
    } catch (e) {
      ps = [];
    }

    simpan(ps);
    return ps;
  }
}
