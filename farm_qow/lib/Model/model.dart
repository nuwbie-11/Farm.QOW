import 'dart:ffi';

import 'package:farm_qow/Controller/checkup_controller.dart';
import 'package:farm_qow/Controller/sapi_controller.dart';
import 'package:farm_qow/Controller/susu_controller.dart';
import 'package:farm_qow/Model/checkup_model.dart';
import 'package:farm_qow/Model/sapi_model.dart';
import 'package:farm_qow/Model/storage.dart';
import 'package:farm_qow/Model/susu_model.dart';

import 'storage.dart';

class ModelSapi {
  List _sapis = [];

  List get sapis => _sapis;

  set sapis(List value) {
    _sapis = value;
  }

  Future<List> fetch2List() async {
    return await SapiController().fetch2List();
  }

  void resetWrite() {
    List<Map<String, dynamic>> items = [];
    Map<String, dynamic> map;
    for (var item in sapi) {
      Sapi saps = Sapi(
          idSapi: int.parse(item[0].toString()),
          nama: item[1].toString(),
          tglDatang: item[2].toString(),
          tglLahir: item[3].toString(),
          jenisSapi: item[5].toString());
      items.add(saps.toJson());
    }
    // print(items);
    SapiController sapiC = SapiController();
    sapiC.writeJson(items);
  }

  void write(currentSapi) {
    List<Map<String, dynamic>> items = [];
    Map<String, dynamic> map;
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
    SapiController sapiC = SapiController();
    sapiC.writeJson(items);
  }
}

class ModelCheckUp {
  List header = [
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
  List _cekups = [];

  List get cekups => _cekups;

  set cekups(List value) {
    _cekups = value;
  }

  Future<List> fetch2List() async {
    return await CheckUpController().fetch2List();
  }

  void resetWrite() {
    List<Map<String, dynamic>> items = [];
    Map<String, dynamic> map;
    for (var item in checkup) {
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
    CheckUpController checkupC = CheckUpController();
    checkupC.writeJson(items);
  }

  void write(current) {
    List<Map<String, dynamic>> items = [];
    Map<String, dynamic> map;
    for (var item in current) {
      print(item);
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
    CheckUpController checkupC = CheckUpController();
    checkupC.writeJson(items);
  }
}

class ModelSusu {
  List _susus = [];

  List get susus => _susus;

  set susus(List value) {
    _susus = value;
  }

  Future<List> fetch2List() async {
    return await SusuController().fetch2List();
  }

  void resetWrite() {
    List<Map<String, dynamic>> items = [];
    Map<String, dynamic> map;
    for (var item in susu) {
      Susu sus = Susu(
          idSusu: int.parse(item[0].toString()),
          idProfilSapi: int.parse(item[1].toString()),
          jumlahSusu: int.parse(item[2].toString()),
          grade: (item[3].toString()),
          fat: double.parse(item[4].toString()),
          snf: double.parse(item[5].toString()),
          density: double.parse(item[6].toString()),
          lactose: double.parse(item[7].toString()),
          solids: double.parse(item[8].toString()),
          protein: double.parse(item[9].toString()),
          tgl: int.parse(item[10].toString()),
          bln: int.parse(item[11].toString()),
          thn: int.parse(item[12].toString()));
      items.add(sus.toJson());
    }
    // print(items);
    SusuController susuC = SusuController();
    susuC.writeJson(items);
  }

  void write(current) {
    List<Map<String, dynamic>> items = [];
    Map<String, dynamic> map;
    for (var item in current) {
      print(item);
      Susu sus = Susu(
          idSusu: int.parse(item[0].toString()),
          idProfilSapi: int.parse(item[1].toString()),
          jumlahSusu: int.parse(item[2].toString()),
          grade: (item[3].toString()),
          fat: double.parse(item[4].toString()),
          snf: double.parse(item[5].toString()),
          density: double.parse(item[6].toString()),
          lactose: double.parse(item[7].toString()),
          solids: double.parse(item[8].toString()),
          protein: double.parse(item[9].toString()),
          tgl: int.parse(item[10].toString()),
          bln: int.parse(item[11].toString()),
          thn: int.parse(item[12].toString()));

      items.add(sus.toJson());
    }
    // print(items);
    SusuController susuC = SusuController();
    susuC.writeJson(items);
  }
}
