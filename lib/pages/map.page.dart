import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:house_mobile/models/house_model.dart';
import 'package:house_mobile/models/teste_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
// import 'package:map_controller/map_controller.dart';
// import '../api.dart';

class HouseMap extends StatefulWidget {
  const HouseMap({Key key}) : super(key: key);

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State {
  Future<ListadeCasas> _casas;
  MapController _mapController;

  // List<Marker> allMarkers = [];

  // this._casas.houses.forEach((element) {
  //   allMarkers.add(Marker(
  //     width: 60.0,
  //     height: 60.0,
  //     point: LatLng(element.latitude, element.longitude),
  //     builder: (ctx) => new Container(
  //       child: new IconButton(
  //           icon: Image.asset('assets/logo.png'),
  //           iconSize: 45.0,
  //           onPressed: () {
  //             print('oi');
  //           }),
  //     ),
  //   ));

  //   print(allMarkers);
  // });
  @override
  void initState() {
    super.initState();
    _casas = getDataService();
  }

  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
        appBar: AppBar(
          title: Text('Mapa'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            // future: getDataService(),
            builder:
                (BuildContext context, AsyncSnapshot<ListadeCasas> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const CircularProgressIndicator();

          print('snapshot.hasData');
          print(snapshot.data);
          if (snapshot.hasData) {
            print('snapshot.hasData');
            print(snapshot.data);
            // _casas = snapshot.data;
            return Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      center: LatLng(-22.951201488334075, -46.54147125580036),
                      zoom: 13.0,
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(
                        markers: _generate(),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Text("bad request");
          }
        }));
  }

  //  void mapController(controle) {
  //   setState(() {
  //     _mapController = controle;
  //   });

  List<Marker> _generate() {
    List<Marker> allMarkers = [];

    // if (this._casas != null) {
    //   this._casas.houses.forEach((element) {
    //     allMarkers.add(Marker(
    //       width: 60.0,
    //       height: 60.0,
    //       point: LatLng(element.latitude, element.longitude),
    //       builder: (ctx) => new Container(
    //         child: new IconButton(
    //             icon: Image.asset('assets/logo.png'),
    //             iconSize: 45.0,
    //             onPressed: () {
    //               print('oi');
    //             }),
    //       ),
    //     ));

    //     print('allMarkers');
    //     print(allMarkers);
    //   });
    // } else {
    //   print('Deu ruim!');
    // }

    return allMarkers;
  }

  Future<ListadeCasas> getDataService() async {
    final response = await http.get('http://192.168.0.111:3333/houses');

    print('response.statusCode');
    print(response.statusCode);
    print('response');
    print(response);

    if (response.statusCode == 200)
      return ListadeCasas.fromJson(jsonDecode(response.body));
    else
      throw Exception("Falha no carregamento da lista de casas");
  }
}
