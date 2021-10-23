class Sapi {
  int? idSapi;
  String? nama;
  String? tglDatang;
  String? tglLahir;
  String? jenisSapi;

  Sapi(
      {required this.idSapi,
      required this.nama,
      required this.tglDatang,
      required this.tglLahir,
      required this.jenisSapi});

  factory Sapi.fromJson(Map<String, dynamic> json) {
    return Sapi(
        idSapi: json['idProfilSapi'],
        nama: json["nama"],
        tglDatang: json['tglDatang'],
        tglLahir: json['tglLahir'],
        jenisSapi: json['jenisSapi']);
  }

  Map<String, dynamic> toJson() => {
        "idProfilSapi": idSapi,
        "nama": nama,
        "tglDatang": tglDatang,
        "tglLahir": tglLahir,
        "jenisSapi": jenisSapi
      };


  
}
