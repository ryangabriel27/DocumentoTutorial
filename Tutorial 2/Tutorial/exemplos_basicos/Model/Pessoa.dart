class Pessoa {
  String nome;
  int idade;

  // Construtor
  Pessoa(this.nome, this.idade);

  // Método
  void apresentar() {
    print("Olá, meu nome é $nome e eu tenho $idade anos.");
  }
}