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
      {required this.idCheckup,
      required this.idProfilSapi,
      required this.diagnosaDokter,
      required this.catatan,
      required this.beratSapi,
      required this.nafsuMakan,
      required this.aktifTanggap,
      required this.gerakTubuh,
      required this.warnaFeses,
      required this.bauFeses,
      required this.teksturFeses,
      required this.suhuTubuh,
      required this.denyutNadi,
      required this.tglCheckUp,
      required this.blncheckup,
      required this.thnCheckup});

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
