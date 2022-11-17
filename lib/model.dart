class PengalamanModel {
  String? kantor;
  int? lamapengalaman;
  String? profesi;

  PengalamanModel({this.kantor, this.lamapengalaman, this.profesi});

  PengalamanModel.fromJson(Map<String, dynamic> json) {
    kantor = json['kantor'];
    lamapengalaman = json['lama_pengalaman'];
    profesi = json['profesi'];
  }
}

class InfoModel {
  String? alamat;
  String? wa;

  InfoModel({this.alamat, this.wa});

  InfoModel.fromJson(Map<String, dynamic> json) {
    alamat = json['alamat'];
    wa = json['wa'];
  }
}

class DataModel {
  String? nama;
  int? umur;
  String? alamat;
  InfoModel? info;
  List<PengalamanModel>? pengalaman;

  DataModel({this.nama, this.umur, this.alamat, this.info, this.pengalaman});
  DataModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    umur = json['umur'];
    alamat = json['alamat'];
    info = InfoModel.fromJson(json['info']);
    pengalaman = List<PengalamanModel>.from(json['pengalaman'].map((value) {
      return PengalamanModel.fromJson(value);
    }));
  }
}
