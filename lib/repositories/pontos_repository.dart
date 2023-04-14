import 'package:flutter/material.dart';
import 'package:xique_trilhas/models/ponto.dart';

class PontosRepository extends ChangeNotifier {
  final List<Ponto> _pontos = [
    Ponto(
      nome: 'Entrada do IF Baiano',
      foto: 'assets/images/photos/entrada.png',
      icone: 'assets/images/icons/ponto_carro.png',
      latitude: -10.827625,
      longitude: -42.689137,
      descricao:
          'O entrada do IF Baiano Campus Xique-Xique está localizada no rodovia Rodovia BA 052, Km 458, s/n Zona Rural, Xique-Xique - BA, 47400-000',
    ),
    Ponto(
      nome: 'Estacionamento',
      foto: 'assets/images/photos/estacionamento.jpeg',
      icone: 'assets/images/icons/ponto_carro.png',
      latitude: -10.824249,
      longitude: -42.688159,
      descricao:
          'O trilheiro poderá estacionar seu carro no estacionamento do IF Baiano',
    ),
    Ponto(
      nome: 'Entrada da Trilha',
      foto: 'assets/images/photos/entrada_trilha.png',
      icone: 'assets/images/icons/ponto_audio.png',
      latitude: -10.823292,
      longitude: -42.688681,
      descricao: 'Áudio: a trilha ecológica do IF Baiano ...',
    ),
    Ponto(
      nome: 'Jurema Preta',
      foto: 'assets/images/photos/entrada_trilha.png',
      icone: 'assets/images/icons/ponto_audio.png',
      latitude: -10.821444,
      longitude: -42.688293,
      descricao: 'Áudio: ...',
    ),
    Ponto(
      nome: 'Favela',
      foto: 'assets/images/photos/favela.png',
      icone: 'assets/images/icons/ponto_audio.png',
      latitude: -10.822821,
      longitude: -42.689356,
      descricao: 'Áudio: ...',
    ),
    Ponto(
      nome: 'Caatinga',
      foto: 'assets/images/photos/entrada_trilha.png',
      icone: 'assets/images/icons/ponto_audio.png',
      latitude: -10.821548,
      longitude: -42.687353,
      descricao: 'Áudio: ...',
    ),
    Ponto(
      nome: '',
      foto: 'assets/images/photos/entrada_trilha.png',
      icone: 'assets/images/icons/ponto_audio.png',
      latitude: -10.822435,
      longitude: -42.687284,
      descricao: 'Áudio: ...',
    ),
  ];

  List<Ponto> get pontos => _pontos;
}
