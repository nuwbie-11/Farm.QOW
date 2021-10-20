import 'dart:convert';
import 'dart:io';

import 'package:farm_qow/Model/checkup_model.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class CheckUpController {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    final file = File(path + "/" + "checkup.json");
    return file;
  }

  Future<String> jsonAsString() async {
    try {
      final file = await _localFile;
      final content = await file.readAsString();
      return content;
    } catch (e) {
      print(e);
    }
    return '[]';
  }

  Future<File> writeJson(List<Map<String, dynamic>> jsonFile) async {
    final file = await _localFile;
    if (file.existsSync()) {
      // Write the file
      print("object");
      return file.writeAsString(jsonEncode(jsonFile));
    }
    print(file.existsSync());
    file.create();
    return file.writeAsString(jsonEncode(jsonFile));
  }

  Future<File> resetWrite(List<Map<String, dynamic>> jsonFile) async {
    final file = await _localFile;
    if (file.existsSync()) {
      // Write the file
      print("object");
      return file.writeAsString(jsonEncode(jsonFile));
    }
    print(file.existsSync());
    file.create();
    return file.writeAsString(jsonEncode(jsonFile));
  }

  dynamic jsonToDynamic() {
    dynamic res = jsonAsString().then((result) {
      // print("from whole : $result");
      final res = jsonDecode(result);
      return res;
    });
    return res;
  }

  bool _checkExist(id, jsonFile) {
    for (var item in jsonFile) {
      if (id == item["idCheckUp"]) {
        return false;
      }
    }
    return true;
  }

  bool addCheckUp(
      idCheckup,
      idProfilSapi,
      diagnosaDokter,
      catatan,
      beratSapi,
      nafsuMakan,
      aktifTanggap,
      gerakTubuh,
      warnaFeses,
      bauFeses,
      teksturFeses,
      suhuTubuh,
      denyutNadi,
      List<Map<String, dynamic>> jsonFile) {
    print(idCheckup);
    DateTime now = DateTime.now();
    String thnCheckup = DateFormat('yyyy').format(now);
    String blncheckup = DateFormat('MM').format(now);
    String tglCheckUp = DateFormat('dd').format(now);
    if (_checkExist(idCheckup, jsonFile)) {
      CheckUp checkup = CheckUp(
          idCheckup: idCheckup,
          idProfilSapi: idProfilSapi,
          diagnosaDokter: diagnosaDokter,
          catatan: catatan,
          beratSapi: beratSapi,
          nafsuMakan: nafsuMakan,
          aktifTanggap: aktifTanggap,
          gerakTubuh: gerakTubuh,
          warnaFeses: warnaFeses,
          bauFeses: bauFeses,
          teksturFeses: teksturFeses,
          suhuTubuh: suhuTubuh,
          denyutNadi: denyutNadi,
          tglCheckUp: tglCheckUp,
          blncheckup: blncheckup,
          thnCheckup: thnCheckup);
      Map<String, dynamic> jsonContent = checkup.toJson();
      jsonFile.add(jsonContent);
      writeJson(jsonFile);
      return true;
    }

    return false;
  }

  dynamic fetchWhereId(int idProfilSapi) {
    dynamic jsonFile = [];
    final jsonContent = jsonToDynamic().then((result) {
      for (var item in result) {
        if (item["idProfilSapi"] == idProfilSapi) {
          jsonFile.add(item);
          print(jsonFile);
          return jsonFile;
        }
      }
    });
    return jsonContent;
  }
}
