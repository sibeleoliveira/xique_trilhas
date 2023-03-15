import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:xique_trilhas/pages/pontos_page.dart';
import 'package:xique_trilhas/repositories/pontos_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(
    ChangeNotifierProvider<PontosRepository>(
      create: (_) => PontosRepository(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trilha do IF Baiano',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const PontosPage(),
    );
  }
}
