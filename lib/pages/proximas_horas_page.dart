import 'package:flutter/material.dart';
import '../components/listProximasHoras.dart';
import 'package:flutter_weather_app/models/clima_hora_model.dart';
import 'package:flutter_weather_app/services/clima_tempo_service.dart';

class ProximasHorasPage extends StatefulWidget {
  @override
  _ProximasHorasPageState createState() => _ProximasHorasPageState();
  
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'HORAS';
  }
}

class _ProximasHorasPageState extends State<ProximasHorasPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClimaHora>>(
      future: ClimaTempo.proximasHoras(5346),
      builder: buildFutureProximasHoras,
    );
  }

  Widget buildFutureProximasHoras(
      BuildContext context, AsyncSnapshot<List<ClimaHora>> snapshot) {
    if (snapshot.hasData) {
      return ListProximasHoras(
        dados: snapshot.data,
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          snapshot.hasError ? Text('${snapshot.error}') : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
