import 'dart:convert';

import 'package:farm_qow/Model/checkup_model.dart';
import 'package:farm_qow/Model/storage.dart';

class CheckUpController {
  CheckUp check = CheckUp();
  static List header = [
    "Id Checkup",
    "Id Sapi",
    "tanggal checkup",
    "bulancheckup",
    "tahun checktup",
    "berat",
    "suhu tubuh",
    "denyut nadi",
    "nafsu makan",
    "aktif",
    "gerak tubuh",
    "warna feses",
    "bau feses",
    "testur feses",
    "Diagnosa Dokter",
    "catatan"
  ];

  List checkUpContent = [];
  dynamic getDataCheckUp() async {
    final file = await check.localFile;
    final content = await file.readAsString();
    // print(content == '');
    final res = content == '' ? [] : jsonDecode(content);
    // print(res);

    for (var item in res) {
      checkUpContent.add([
        item["idCheckUp"],
        item["idProfilSapi"],
        item['tglCheckUp'],
        item['blncheckup'],
        item['thnCheckup'],
        item['beratSapi'],
        item['suhuTubuh'],
        item['denyutNadi'],
        item['nafsuMakan'],
        item['aktifTanggap'],
        item['gerakTubuh'],
        item['warnaFeses'],
        item['bauFeses'],
        item['teksturFeses'],
        item['diagnosaDokter'],
        item["catatan"]
      ]);
    }
    // print(sapiContent);
    return checkUpContent;
  }

  void simpan(current) {
    List<Map<String, dynamic>> items = [];
    for (var item in current) {
      CheckUp saps = CheckUp(
          idCheckup: int.parse(item[0].toString()),
          idProfilSapi: int.parse(item[1].toString()),
          diagnosaDokter: item[14].toString(),
          catatan: item[15].toString(),
          beratSapi: int.parse(item[5].toString()),
          nafsuMakan: item[8].toString(),
          aktifTanggap: item[9].toString(),
          gerakTubuh: item[10].toString(),
          warnaFeses: item[11].toString(),
          bauFeses: item[12].toString(),
          teksturFeses: item[13].toString(),
          suhuTubuh: item[6].toString(),
          denyutNadi: item[7].toString(),
          tglCheckUp: item[2].toString(),
          blncheckup: item[3].toString(),
          thnCheckup: item[4].toString());
      items.add(saps.toJson());
    }
    // print(items);

    check.write(items);
  }

  dynamic populateUser() {
    List ps = [];
    for (var item in checkup) {
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
