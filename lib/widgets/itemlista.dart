import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:aplicativo_lista/entidades/tarefa.dart';

class ItemLista extends StatelessWidget {
  const ItemLista({super.key, required this.tarefa, required this.deletarTarefa});

  final Tarefa tarefa;
  final Function(Tarefa) deletarTarefa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.22,
          children: [
            SlidableAction(
              onPressed: (context) => {
                deletarTarefa(tarefa)
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Excluir',
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
        ),
      ),
    );
  }
}
