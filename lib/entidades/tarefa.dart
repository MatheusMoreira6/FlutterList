class Tarefa {
  String nomeTarefa;
  DateTime dataTarefa;

  Tarefa({required this.nomeTarefa, required this.dataTarefa});

  String getNomeTarefa() {
    return (nomeTarefa);
  }

  DateTime getDataTarefa() {
    return (dataTarefa);
  }
}
