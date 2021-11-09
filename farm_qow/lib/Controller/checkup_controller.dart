import 'dart:convert';
import 'dart:io';

import 'package:farm_qow/Model/checkup_model.dart';
import 'package:path_provider/path_provider.dart';

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
  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();

  //   return directory.path;
  // }

  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   final file = File(path + "/" + "checkup.json");
  //   if (file.existsSync()) {
  //     // print(file.existsSync());
  //     return file;
  //   }
  //   file.create();
  //   return file;
  // }

  Future<File> simpan(List<Map<String, dynamic>> jsonFile) async {
    final file = await check.localFile;
    if (file.existsSync()) {
      // Write the file
      return file.writeAsString(jsonEncode(jsonFile));
    }
    file.create();
    return file.writeAsString(jsonEncode(jsonFile));
  }

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

  void write(current) {
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

    simpan(items);
  }
}
