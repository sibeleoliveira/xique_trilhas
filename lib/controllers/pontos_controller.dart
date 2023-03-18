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

  loadRota() {
    polyline.add(const Polyline(
      polylineId: PolylineId('1'),
      points: [
        LatLng(-10.8188980, -42.7292820),
        LatLng(-10.8189030, -42.7292800),
        LatLng(-10.8189160, -42.7292870),
        LatLng(-10.8189270, -42.7292930),
        LatLng(-10.8189290, -42.7292940),
        LatLng(-10.8189330, -42.7292950),
        LatLng(-10.8189280, -42.7292980),
        LatLng(-10.8189420, -42.7293010),
        LatLng(-10.8189540, -42.7293100),
        LatLng(-10.8189640, -42.7293140),
        LatLng(-10.8189670, -42.7293230),
        LatLng(-10.8189690, -42.7293340),
      ],
      color: Colors.green,
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
