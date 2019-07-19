import 'package:flutter/material.dart';
import './listItemproximashoras.dart';
import '../models/clima_hora_model.dart';

class ListProximasHoras extends StatefulWidget {
  final List<ClimaHora> dados;

  ListProximasHoras({this.dados});

  @override
  _ListProximasHorasState createState() => _ListProximasHorasState();
}

class _ListProximasHorasState extends State<ListProximasHoras> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.dados.length,
      itemBuilder: (context, i) => ListItemProximasHoras(
            context: context,
            climaHora: widget.dados[i],
          ),
    );
  }
}
