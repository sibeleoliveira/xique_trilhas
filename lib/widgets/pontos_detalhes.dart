import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:xique_trilhas/models/ponto.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

// ignore: must_be_immutable
class PontoDetalhes extends StatefulWidget {
  Ponto ponto;
  PontoDetalhes({Key? key, required this.ponto}) : super(key: key);

  @override
  State<PontoDetalhes> createState() => _PontoDetalhesState();
}

class _PontoDetalhesState extends State<PontoDetalhes> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.setSource(AssetSource(widget.ponto.audio));

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        position = Duration.zero;
        player.setSource(AssetSource(widget.ponto.audio));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color.fromRGBO(9, 182, 155, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(widget.ponto.foto,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.ponto.titulo,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MontserratSemiBold',
                          color: Color.fromRGBO(46, 46, 46, 1)),
                    ),
                    Text(
                      widget.ponto.subtitulo,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(46, 46, 46, 1)),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
                  radius: 20,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    iconSize: 20,
                    onPressed: () async {
                      if (isPlaying) {
                        await player.pause();
                      } else {
                        await player.resume();
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ProgressBar(
              progressBarColor: const Color.fromRGBO(46, 46, 46, 1),
              thumbColor: Color.fromARGB(255, 135, 115, 115),
              baseBarColor: const Color.fromRGBO(46, 46, 46, 0.5),
              thumbRadius: 9,
              progress: position,
              total: duration,
              timeLabelTextStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(46, 46, 46, 1)),
              onSeek: (newPosition) async {
                final position = newPosition;
                await player.seek(position);
              },
            ),
          ],
        ),
      ),
    );
  }
}
