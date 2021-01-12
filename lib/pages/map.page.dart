import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:house_mobile/models/teste_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class HouseMap extends StatefulWidget {
  const HouseMap({Key key}) : super(key: key);

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State {
  List<Marker> allMarkers = [];

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        centerTitle: true,
      ),
      body: new FlutterMap(
        // mapController: _mapController,
        options: new MapOptions(
          center: LatLng(-22.951201488334075, -46.54147125580036),
          zoom: 13.0,
        ),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          new MarkerLayerOptions(
            markers: [
              Marker(
                  width: 60.0,
                  height: 60.0,
                  point: LatLng(-22.951201488334075, -46.54147125580036),
                  builder: (ctx) => new Container(
                        child: new IconButton(
                            icon: Image.asset('assets/logo.png'),
                            iconSize: 45.0,
                            onPressed: () {
                              print('oi');
                            }),
                      )),
              Marker(
                  width: 60.0,
                  height: 60.0,
                  point: LatLng(-22.920201488334075, -46.55147125580036),
                  builder: (ctx) => new Container(
                        child: new IconButton(
                            icon: Image.asset('assets/logo.png'),
                            iconSize: 45.0,
                            onPressed: () {
                              print('oi');
                            }),
                      )),
              Marker(
                  width: 60.0,
                  height: 60.0,
                  point: LatLng(-22.930201488334075, -46.52147125580036),
                  builder: (ctx) => new Container(
                        child: new IconButton(
                            icon: Image.asset('assets/logo.png'),
                            iconSize: 45.0,
                            onPressed: () {
                              print('oi');
                            }),
                      )),
            ],
          ),
        ],
      ),
    );
  }

  setMarkers() {
    allMarkers.add(new Marker(
        width: 60.0,
        height: 60.0,
        point: LatLng(-22.951201488334075, -46.54147125580036),
        builder: (ctx) => new Container(
              child: new IconButton(
                  icon: Image.asset('assets/logo.png'),
                  iconSize: 45.0,
                  onPressed: () {
                    print('oi');
                  }),
            )));
    return allMarkers;
  }

  Future<ListadeCasas> fetch() async {
    var url = 'http://192.168.0.111:3333/houses/';
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var todo = ListadeCasas.fromJson(json);
    return todo;
  }
}
