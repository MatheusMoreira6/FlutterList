import 'package:aplicativo_lista/entidades/tarefa.dart';
import 'package:aplicativo_lista/widgets/itemlista.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textTarefasController = TextEditingController();

  List<Tarefa> tarefas = [];
  int quantidadeTarefas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Adicione uma Tarefa',
                    ),
                    controller: textTarefasController,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: addTarefa,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(14),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ],
            ),
            Flexible(
              child: ListView(
                shrinkWrap: false,
                children: [
                  for (Tarefa tarefa in tarefas)
                    ItemLista(
                      titulo: tarefa.getNomeTarefa(),
                    ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child:
                      Text('Você possui $quantidadeTarefas tarefas pendentes'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: clearTarefa,
                  child: const Text('Limpar Tudo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addTarefa() {
    setState(() {
      tarefas.add(Tarefa(nomeTarefa: textTarefasController.text, dataTarefa: '2023-08-29'));
      quantidadeTarefas = tarefas.length;
    });
    textTarefasController.clear();
  }

  void clearTarefa() {
    setState(() {
      tarefas.clear();
      quantidadeTarefas = tarefas.length;
    });
  }
}
