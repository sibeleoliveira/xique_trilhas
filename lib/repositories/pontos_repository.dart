import 'package:flutter/material.dart';
import 'package:xique_trilhas/models/ponto.dart';

class PontosRepository extends ChangeNotifier {
  final List<Ponto> _pontos = [
    // Ponto(
    //   titulo: 'Entrada do IF Baiano',
    //   subtitulo: 'Depois',
    //   foto: 'assets/images/photos/entrada.png',
    //   icone: 'assets/images/icons/ponto_carro.png',
    //   latitude: -10.827625,
    //   longitude: -42.689137,
    //   descricao:
    //       'O entrada do IF Baiano Campus Xique-Xique está localizada no rodovia Rodovia BA 052, Km 458, s/n Zona Rural, Xique-Xique - BA, 47400-000',
    // ),
    // Ponto(
    //   titulo: 'Estacionamento',
    //   subtitulo: 'Depois',
    //   foto: 'assets/images/photos/estacionamento.jpeg',
    //   icone: 'assets/images/icons/ponto_carro.png',
    //   latitude: -10.824249,
    //   longitude: -42.688159,
    //   descricao:
    //       'O trilheiro poderá estacionar seu carro no estacionamento do IF Baiano',
    // ),
    // Ponto(
    //   titulo: 'Entrada da Trilha',
    //   subtitulo: 'Depois',
    //   foto: 'assets/images/photos/entrada_trilha.png',
    //   icone: 'assets/images/icons/ponto_audio.png',
    //   latitude: -10.823292,
    //   longitude: -42.688681,
    //   audio: 'audios/Audio.ogg',
    // ),
    // Ponto(
    //   titulo: 'Jurema Preta',
    //   subtitulo: 'Depois',
    //   foto: 'assets/images/photos/entrada_trilha.png',
    //   icone: 'assets/images/icons/ponto_audio.png',
    //   latitude: -10.821444,
    //   longitude: -42.688293,
    //   audio: 'audios/Audio.ogg',
    // ),
    Ponto(
      titulo: 'Favela',
      subtitulo: 'Cnidoscolus quercifolius',
      latitude: -10.822821,
      longitude: -42.689356,
      icone: 'assets/images/icons/ponto_audio.png',
      foto: 'assets/images/photos/favela.png',
      audio: 'audios/Audio.ogg',
    ),
    Ponto(
      titulo: 'Macambira',
      subtitulo: 'Bromelia laciniosa',
      latitude: -10.821656,
      longitude: -42.688528,
      icone: 'assets/images/icons/ponto_audio.png',
      foto: 'assets/images/photos/macambira.png',
      audio: 'audios/macambira.ogg',
    ),
    // Ponto(
    //   titulo: 'Caatinga',
    //   subtitulo: 'Depois',
    //   latitude: -10.821548,
    //   longitude: -42.687353,
    //   icone: 'assets/images/icons/ponto_audio.png',
    //   foto: 'assets/images/photos/entrada_trilha.png',
    //   audio: 'audios/Audio.ogg',
    // ),
    // Ponto(
    //   titulo: '',
    //   subtitulo: 'Depois',
    //   foto: 'assets/images/photos/entrada_trilha.png',
    //   icone: 'assets/images/icons/ponto_audio.png',
    //   latitude: -10.822435,
    //   longitude: -42.687284,
    //   audio: 'audios/Audio.ogg',
    // ),
  ];

  List<Ponto> get pontos => _pontos;
}
