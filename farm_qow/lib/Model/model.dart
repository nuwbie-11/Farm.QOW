import 'package:farm_qow/Controller/checkup_controller.dart';
import 'package:farm_qow/Controller/sapi_controller.dart';
import 'package:farm_qow/Model/checkup_model.dart';
import 'package:farm_qow/Model/new_model.dart';
import 'package:farm_qow/Model/sapi_model.dart';
import 'package:farm_qow/Model/storage.dart';

class ModelSapi {
  List _sapis = [];
  NewSapiModel newSapi = NewSapiModel();

  List get sapis => _sapis;

  set sapis(List value) {
    _sapis = value;
  }

  Future<List> fetch2List() async {
    return await newSapi.fetch2List();
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
  NewCheckUpModel newCheckUp = NewCheckUpModel();

  List get cekups => _cekups;

  set cekups(List value) {
    _cekups = value;
  }

  Future<List> fetch2List() async {
    return await newCheckUp.fetch2List();
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
