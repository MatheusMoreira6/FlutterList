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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
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
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: false,
                  children: [
                    for (Tarefa tarefa in tarefas)
                      ItemLista(
                        tarefa: tarefa,
                        deletarTarefa: deletarTarefa,
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${tarefas.length} tarefas pendentes',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: clearTarefa,
                      child: const Text(
                        'Limpar Tudo',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTarefa() {
    setState(() {
      tarefas.add(
        Tarefa(
          nomeTarefa: textTarefasController.text,
          dataTarefa: DateTime.now(),
        ),
      );
    });

    textTarefasController.clear();
  }

  void deletarTarefa(Tarefa tarefa) {
    setState(() {
      tarefas.remove(tarefa);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${tarefa.getNomeTarefa()} foi removida com sucesso',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.white,
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            setState(() {
              tarefas.add(tarefa);
            });
          },
        ),
      ),
    );
  }

  void clearTarefa() {
    setState(() {
      tarefas.clear();
    });
  }
}
