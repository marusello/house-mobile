import 'package:latlong/latlong.dart';

class HouseModel {
  int id;
  String proprietario;
  LatLng position;
  String descricao;
  String whatsapp;
  String valor;
  // List<Images> images;

  HouseModel({
    this.id,
    this.proprietario,
    this.position,
    this.descricao,
    this.whatsapp,
    this.valor,
  });
}

final List<HouseModel> houses = [
  HouseModel(
      id: 1,
      proprietario: 'Marcelo',
      position: LatLng(-22.938972080191647, -46.55424618071293),
      descricao: 'Teste',
      whatsapp: '11998300215',
      valor: '1000'),
  HouseModel(
      id: 1,
      proprietario: 'Marcelo',
      position: LatLng(-23.938972080191647, -46.55424618071293),
      descricao: 'Teste',
      whatsapp: '11998300215',
      valor: '1000'),
  HouseModel(
      id: 1,
      proprietario: 'Marcelo',
      position: LatLng(-22.924972970257, -46.568541472719566),
      descricao: 'Teste',
      whatsapp: '11998300215',
      valor: '1000'),
  HouseModel(
      id: 1,
      proprietario: 'Marcelo',
      position: LatLng(-22.92517059864115, -46.54171938470153),
      descricao: 'Teste',
      whatsapp: '11998300215',
      valor: '1000'),
  HouseModel(
      id: 1,
      proprietario: 'Marcelo',
      position: LatLng(-22.937343951159168, -46.54253477617728),
      descricao: 'Teste',
      whatsapp: '11998300215',
      valor: '1000'),
];

//   HouseModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     proprietario = json['proprietario'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     descricao = json['descricao'];
//     whatsapp = json['whatsapp'];
//     valor = json['valor'];
//     if (json['images'] != null) {
//       images = new List<Images>();
//       json['images'].forEach((v) {
//         images.add(new Images.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['proprietario'] = this.proprietario;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['descricao'] = this.descricao;
//     data['whatsapp'] = this.whatsapp;
//     data['valor'] = this.valor;
//     if (this.images != null) {
//       data['images'] = this.images.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Images {
//   int id;
//   String url;

//   Images({this.id, this.url});

//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     url = json['url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['url'] = this.url;
//     return data;
//   }
// }
