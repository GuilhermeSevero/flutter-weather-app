import 'package:flutter/material.dart';
import './listItemproximosDias.dart';
import '../models/clima_dia_model.dart';

class ListProximosDias extends StatefulWidget {
  final List<ClimaDia> dados;

  ListProximosDias({this.dados});

  @override
  _ListProximosDiasState createState() => _ListProximosDiasState();
}

class _ListProximosDiasState extends State<ListProximosDias> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.dados.length,
      itemBuilder: (context, i) => ListItemProximosDias(
            context: context,
            climaDia: widget.dados[i],
          ),
    );
  }
}
