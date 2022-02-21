class PostObject {
  int id;
  int idnguoidung;
  int iddiadanh;
  String NoiDung;
  int TrangThaiTonTai;

  PostObject(this.id, this.idnguoidung, this.iddiadanh, this.NoiDung,
      this.TrangThaiTonTai);
  PostObject.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        idnguoidung = json["idnguoidung"],
        iddiadanh = json["iddiadanh"],
        NoiDung = json["NoiDung"],
        TrangThaiTonTai = json["TrangThaiTonTai"];
}
