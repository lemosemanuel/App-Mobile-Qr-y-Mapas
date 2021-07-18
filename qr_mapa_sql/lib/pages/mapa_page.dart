import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_mapa_sql/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa_page extends StatefulWidget {
  const Mapa_page({Key? key}) : super(key: key);

  @override
  State<Mapa_page> createState() => _Mapa_pageState();
}

class _Mapa_pageState extends State<Mapa_page> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)!.settings.arguments as ScanModel?;

    final CameraPosition puntoInicial = CameraPosition(
      target: scan!.getLatLng(),
      zoom: 17,
      tilt: 50,
    );
    //marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: scan.getLatLng(), zoom: 17, tilt: 50),
                  ),
                );
              },
              icon: Icon(Icons.map))
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.hybrid;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
      ),
    );
  }
}
