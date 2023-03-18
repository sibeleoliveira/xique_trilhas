import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xique_trilhas/pages/pontos_page.dart';
import 'package:xique_trilhas/repositories/pontos_repository.dart';
import 'package:xique_trilhas/widgets/pontos_detalhes.dart';
import 'package:gpx/gpx.dart';

class PontosController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  Set<Marker> markers = {};
  Set<Polyline> polyline = {};
  late GoogleMapController _mapsController;

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
    loadpontos();
    loadRotaFromGPX();
  }

  loadRotaFromGPX() async {
    String xmlString = await rootBundle.loadString('resources/trilha_if.gpx');
    var xmlGpx = GpxReader().fromString(xmlString);
    List<LatLng> latLngList = [];
    for (Wpt wtp in xmlGpx.trks.single.trksegs.single.trkpts) {
      latLngList.add(LatLng(wtp.lat!, wtp.lon!));
    }
    polyline.add(Polyline(
      polylineId: const PolylineId('1'),
      points: latLngList,
      color: Colors.cyan,
    ));
  }

  loadpontos() {
    final pontos = PontosRepository().pontos;
    pontos.forEach((ponto) async {
      markers.add(
        Marker(
          markerId: MarkerId(ponto.nome),
          position: LatLng(ponto.latitude, ponto.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(),
            ponto.icone,
          ),
          onTap: () => {
            showModalBottomSheet(
              context: appKey.currentState!.context,
              builder: (context) => PontoDetalhes(ponto: ponto),
            )
          },
        ),
      );
    });
    notifyListeners();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}
