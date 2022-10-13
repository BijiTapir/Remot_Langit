final String tableWilayah = 'movie';

class WilayahFields {
  static final List<String> values = [id, kota, negara];
  static const String id = '_id';
  static const String kota = 'kota';
  static const String negara = 'negara';
  static const String img = 'img';
}

class WilayahModel {
  final int? id;
  final String kota;
  final String negara;
  final String img;

  WilayahModel(
      {this.id, required this.kota, required this.negara, required this.img});

  static WilayahModel fromJson(Map<String, Object?> json) => WilayahModel(
      id: json[WilayahFields.id] as int?,
      kota: json[WilayahFields.kota] as String,
      negara: json[WilayahFields.negara] as String,
      img: json[WilayahFields.img] as String);

  Map<String, Object?> toJson() => {
        WilayahFields.id: id,
        WilayahFields.kota: kota,
        WilayahFields.negara: negara,
        WilayahFields.img: img
      };

  WilayahModel copy({int? id, String? kota, String? negara, String? img}) =>
      WilayahModel(
          id: id ?? this.id,
          kota: kota ?? this.kota,
          negara: negara ?? this.negara,
          img: img ?? this.img);
}
