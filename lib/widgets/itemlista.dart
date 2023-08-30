import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aplicativo_lista/entidades/tarefa.dart';

class ItemLista extends StatelessWidget {
  const ItemLista({super.key, required this.tarefa});

  final Tarefa tarefa;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('dd/MM/yyyy').format(tarefa.getDataTarefa()),
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            tarefa.getNomeTarefa(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
