import 'dart:convert';
import 'dart:io';

import 'package:farm_qow/Model/sapi_model.dart';
import 'package:path_provider/path_provider.dart';

class SapiController {
  Sapi sapi = Sapi();

  List sapiContent = [];

  dynamic getDataSapi() async {
    final file = await sapi.localFile;
    final content = await file.readAsString();
    final res = content == '' ? [] : jsonDecode(content);
    // List myList = await jsonToDynamic();
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
}
