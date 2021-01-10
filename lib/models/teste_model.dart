// class TesteModel {
//   final int id;
//   final String proprietario;
//   final double latitude;
//   final double longitude;
//   final String descricao;
//   final String whatsapp;
//   final String valor;

//   TesteModel({
//     this.id,
//     this.proprietario,
//     this.latitude,
//     this.longitude,
//     this.descricao,
//     this.whatsapp,
//     this.valor,
//   });
// }

// class ListadeCasas {
//   List<TesteModel> houses;

//   ListadeCasas({this.houses});

//   factory ListadeCasas.fromJSON(Map<String, dynamic> json) {
//     List<TesteModel> lista = List();
//     for (dynamic item in json['houses']) {
//       Map<String, dynamic> converted = item as Map<String, dynamic>;
//       lista.add(new TesteModel(
//         id: converted['id'],
//         proprietario: converted['proprietario'],
//         latitude: converted['latitude'],
//         longitude: converted['longitude'],
//         descricao: converted['descricao'],
//         whatsapp: converted['whatsapp'],
//         valor: converted['valor'],
//       ));
//     }

//     return ListadeCasas(houses: lista);
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

class ListadeCasas {
  int id;
  String proprietario;
  double latitude;
  double longitude;
  String descricao;
  String whatsapp;
  String valor;
  List<Images> images;

  ListadeCasas(
      {this.id,
      this.proprietario,
      this.latitude,
      this.longitude,
      this.descricao,
      this.whatsapp,
      this.valor,
      this.images});

  ListadeCasas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    proprietario = json['proprietario'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    descricao = json['descricao'];
    whatsapp = json['whatsapp'];
    valor = json['valor'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['proprietario'] = this.proprietario;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['descricao'] = this.descricao;
    data['whatsapp'] = this.whatsapp;
    data['valor'] = this.valor;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int id;
  String url;

  Images({this.id, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
