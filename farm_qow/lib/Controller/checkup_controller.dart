import 'dart:convert';
import 'dart:io';

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

  List checkUpContent = [];
  dynamic fetch2List() async {
    List myList = await jsonToDynamic();
    for (var item in myList) {
      this.checkUpContent.add([
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
}
