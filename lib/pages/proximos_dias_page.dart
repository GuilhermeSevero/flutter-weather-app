import 'package:flutter/material.dart';
import '../components/listProximosDias.dart';
import 'package:flutter_weather_app/models/clima_dia_model.dart';
import 'package:flutter_weather_app/services/clima_tempo_service.dart';

class ProximosDiasPage extends StatefulWidget {
  @override
  _ProximosDiasPageState createState() => _ProximosDiasPageState();
  
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'DIAS';
  }
}

class _ProximosDiasPageState extends State<ProximosDiasPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClimaDia>>(
      future: ClimaTempo.proximosDias(5346),
      builder: buildFutureProximasHoras,
    );
  }

  Widget buildFutureProximasHoras(
      BuildContext context, AsyncSnapshot<List<ClimaDia>> snapshot) {
    if (snapshot.hasData) {
      return ListProximosDias(
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
