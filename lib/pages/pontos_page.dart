import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xique_trilhas/controllers/pontos_controller.dart';
import 'package:provider/provider.dart';

final appKey = GlobalKey();

class PontosPage extends StatelessWidget {
  const PontosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: AppBar(
        title: const Text('Trilha do IF Baiano'),
      ),
      body: ChangeNotifierProvider<PontosController>(
        create: (context) => PontosController(),
        child: Builder(builder: (context) {
          final local = context.watch<PontosController>();

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(local.lat, local.long),
              zoom: 15,
            ),
            zoomControlsEnabled: true,
            mapType: MapType.hybrid,
            myLocationEnabled: true,
            onMapCreated: local.onMapCreated,
            markers: local.markers,
          );
        }),
      ),
    );
  }
}
