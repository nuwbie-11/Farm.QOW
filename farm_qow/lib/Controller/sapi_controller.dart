import 'dart:convert';
import 'dart:io';

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

  List sapiContent = [];

  dynamic fetch2List() async {
    List myList = await jsonToDynamic();
    for (var item in myList) {
      this.sapiContent.add([
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
}
