import 'package:farm_qow/Controller/checkup_controller.dart';
import 'package:farm_qow/Controller/sapi_controller.dart';

class NewSapiModel {
  // [1, "Yusrian", "17-07-2020", "17-07-2020", "Sehat", "sapi jersey"],
  List sapiContent = [];

  dynamic fetch2List() async {
    List myList = await SapiController().jsonToDynamic();
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

// [
//     "Id Checkup",
//     "Id Sapi","tanggal checkup","bulancheckup","tahun checktup","berat","suhu tubuh",
//     "denyut nadi","nafsu makan","aktif","gerak tubuh","warna feses","bau feses","testur feses","Diagnosa Dokter","catatan"
//   ],
class NewCheckUpModel {
  List checkUpContent = [];
  dynamic fetch2List() async {
    List myList = await CheckUpController().jsonToDynamic();
    for (var json in myList) {
      this.checkUpContent.add([
        json["idCheckUp"],
        json["idProfilSapi"],
        json['tglCheckUp'],
        json['blncheckup'],
        json['thnCheckup'],
        json['beratSapi'],
        json['suhuTubuh'],
        json['denyutNadi'],
        json['nafsuMakan'],
        json['aktifTanggap'],
        json['gerakTubuh'],
        json['warnaFeses'],
        json['bauFeses'],
        json['teksturFeses'],
        json['diagnosaDokter'],
        json["catatan"]
      ]);
    }
    // print(sapiContent);
    return checkUpContent;
  }
}
