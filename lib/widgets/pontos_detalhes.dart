import 'package:flutter/material.dart';
import 'package:xique_trilhas/models/ponto.dart';

// ignore: must_be_immutable
class PontoDetalhes extends StatelessWidget {
  Ponto ponto;
  PontoDetalhes({Key? key, required this.ponto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        // Image.network(ponto.foto,
        //     height: 250,
        //     width: MediaQuery.of(context).size.width,
        //     fit: BoxFit.cover),
        Image.asset(ponto.foto,
            height: 250,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24),
          child: Text(
            ponto.nome,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 60, left: 24),
          child: Text(
            ponto.descricao,
          ),
        ),
      ],
    );
  }
}
