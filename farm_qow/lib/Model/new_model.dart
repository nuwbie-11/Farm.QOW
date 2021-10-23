import 'package:farm_qow/Controller/checkup_controller.dart';
import 'package:farm_qow/Controller/sapi_controller.dart';

class NewSapiModel {
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
    return sapiContent;
  }
}

class NewControllerModel {
  static fetch2List() {
    final jsonFile = CheckUpController().jsonToDynamic().then((result) {
      List jsonFile = [];
      for (var item in result) {
        jsonFile.add(item);
      }
      return jsonFile;
    });
  }
}
