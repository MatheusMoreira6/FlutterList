class Tarefa {

  Tarefa({required this.nomeTarefa, required this.dataTarefa});

  String nomeTarefa;
  DateTime dataTarefa;

  String getNomeTarefa() {
    return (nomeTarefa);
  }

  DateTime getDataTarefa() {
    return (dataTarefa);
  }
}
