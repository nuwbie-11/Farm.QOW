import 'dart:convert';
import 'dart:io';

import 'package:farm_qow/Model/sapi_model.dart';
import 'package:path_provider/path_provider.dart';

class SapiController {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    final file = File(path + "/" + "sapi.json");
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
      if (id == item["idProfilSapi"]) {
        return false;
      }
    }
    return true;
  }

  bool transactSapi(id, String nama, String tglDatang, String tglLahir,
      String jenisSapi, List<Map<String, dynamic>> jsonFile) {
    if (_checkExist(id, jsonFile)) {
      Sapi sapi = Sapi(
          idSapi: id,
          nama: nama,
          tglDatang: tglDatang,
          tglLahir: tglLahir,
          jenisSapi: jenisSapi);
      Map<String, dynamic> jsonContent = sapi.toJson();
      jsonFile.add(jsonContent);
      writeJson(jsonFile);
      return true;
    }
    return false;
  }

  dynamic fetchAll() {
    dynamic jsonFile = [];
    final jsonContent = jsonToDynamic().then((result) {
      for (var item in result) {
        jsonFile.add(item);
        return jsonFile;
      }
    });
    return jsonContent;
  }

  dynamic fetchWhereId(int idProfilSapi) {
    dynamic jsonFile = [];
    final jsonContent = jsonToDynamic().then((result) {
      for (var item in result) {
        if (item["idProfilSapi"] == idProfilSapi) {
          jsonFile.add(item);
          // print(jsonFile);
          return jsonFile;
        }
      }
    });
    return jsonContent;
  }
}
