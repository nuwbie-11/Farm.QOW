import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CheckUp {
  int? idCheckup;
  int? idProfilSapi;
  String? diagnosaDokter;
  String? catatan;
  int? beratSapi;
  String? nafsuMakan;
  String? aktifTanggap;
  String? gerakTubuh;
  String? warnaFeses;
  String? bauFeses;
  String? teksturFeses;
  String? suhuTubuh;
  String? denyutNadi;
  String? tglCheckUp;
  String? blncheckup;
  String? thnCheckup;

  CheckUp(
      {this.idCheckup,
      this.idProfilSapi,
      this.diagnosaDokter,
      this.catatan,
      this.beratSapi,
      this.nafsuMakan,
      this.aktifTanggap,
      this.gerakTubuh,
      this.warnaFeses,
      this.bauFeses,
      this.teksturFeses,
      this.suhuTubuh,
      this.denyutNadi,
      this.tglCheckUp,
      this.blncheckup,
      this.thnCheckup});
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    final file = File(path + "/" + "checkup.json");
    if (file.existsSync()) {
      // print(file.existsSync());
      return file;
    }
    file.create();
    return file;
  }

  factory CheckUp.fromJson(Map<String, dynamic> json) {
    return CheckUp(
        idCheckup: json["idCheckUp"],
        idProfilSapi: json["idProfilSapi"],
        diagnosaDokter: json['diagnosaDokter'],
        catatan: json["catatan"],
        beratSapi: json['beratSapi'],
        nafsuMakan: json['nafsuMakan'],
        aktifTanggap: json['aktifTanggap'],
        gerakTubuh: json['gerakTubuh'],
        warnaFeses: json['warnaFeses'],
        bauFeses: json['bauFeses'],
        teksturFeses: json['teksturFeses'],
        blncheckup: json['blncheckup'],
        denyutNadi: json['denyutNadi'],
        suhuTubuh: json['suhuTubuh'],
        tglCheckUp: json['tglCheckUp'],
        thnCheckup: json['thnCheckup']);
  }

  Map<String, dynamic> toJson() => {
        "idCheckUp": idCheckup,
        "idProfilSapi": idProfilSapi,
        "diagnosaDokter": diagnosaDokter,
        "catatan": catatan,
        "beratSapi": beratSapi,
        "nafsuMakan": nafsuMakan,
        "aktifTanggap": aktifTanggap,
        "gerakTubuh": gerakTubuh,
        "warnaFeses": warnaFeses,
        "bauFeses": bauFeses,
        "teksturFeses": teksturFeses,
        "suhuTubuh": suhuTubuh,
        "denyutNadi": denyutNadi,
        "tglCheckUp": tglCheckUp,
        "blncheckup": blncheckup,
        "thnCheckup": thnCheckup
      };
}
