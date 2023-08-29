class Tarefa {
  String nomeTarefa;
  DateTime dataTarefa;

  Tarefa({required this.nomeTarefa, required this.dataTarefa});

  String getNomeTarefa() {
    return (this.nomeTarefa);
  }

  DateTime getDataTarefa() {
    return (this.dataTarefa);
  }
}
