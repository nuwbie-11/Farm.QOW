import 'dart:convert';

import 'package:farm_qow/Model/sapi_model.dart';
import 'package:farm_qow/Model/storage.dart';

class SapiController {
  Sapi sapi = Sapi();

  List sapiContent = [];

  dynamic getDataSapi() async {
    final file = await sapi.localFile;
    final content = await file.readAsString();
    // final res = content == '' ? [] : jsonDecode(content);
    // List myList = await jsonToDynamic();
    if (content == '') {
      final res = populateSapi();
      return res;
    }
    final res = jsonDecode(content);
    for (var item in res) {
      sapiContent.add([
        item["idProfilSapi"],
        item["nama"],
        item["tglDatang"],
        item["tglLahir"],
        item["jenisSapi"]
      ]);
    }
    // print(sapiContent);
    return sapiContent;
  }

  void simpan(currentSapi) {
    List<Map<String, dynamic>> items = [];
    for (var item in currentSapi) {
      Sapi saps = Sapi(
          idSapi: int.parse(item[0].toString()),
          nama: item[1].toString(),
          tglDatang: item[2].toString(),
          tglLahir: item[3].toString(),
          jenisSapi: item[4].toString());
      items.add(saps.toJson());
    }
    // print(items);

    sapi.write(items);
  }

  dynamic populateSapi() {
    List ps = [];
    for (var item in sapis) {
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
}
