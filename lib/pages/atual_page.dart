import 'package:flutter/material.dart';
import '../components/climaAtual.dart';

class ClimaAtualPage extends StatefulWidget {
  @override
  _AtualPageState createState() => _AtualPageState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'ATUAL';
  }
}

class _AtualPageState extends State<ClimaAtualPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          ClimaAtualWidget(),
        ],
      ),
    );
  }
}
