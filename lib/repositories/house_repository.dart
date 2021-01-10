import 'package:dio/dio.dart';
import 'package:house_mobile/models/house_model.dart';

// class HouseRepository {
//   final dio = Dio();
//   final url = 'http://192.168.0.111:3333/houses';

//   Future<List<HouseModel>> fetchHouse() async {
//     final response = await dio.get(url);
//     final list = response.data as List;

//     List<HouseModel> houses = [];
//     for (var json in list) {
//       final house = HouseModel.fromJson(json);
//       houses.add(house);
//     }

//     return houses;
//   }
// }
