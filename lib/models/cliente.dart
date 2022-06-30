class Clientes{

  final int id;
  final String nome;
  final String cpf;


  Clientes(
      this.id,
      this.nome,
      this.cpf
  );

  @override
  String toString() {
    return 'Clientes{id: $id, nome: $nome, cpf: $cpf}';
  }


}