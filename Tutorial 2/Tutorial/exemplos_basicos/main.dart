import 'Model/Pessoa.dart';

int soma(int a, int b) {
  return a + b;
}

void saudacao(String nome, int? idade) {
  if (idade == null) {
    idade = 18;
  }
  print("Olá, $nome! Você tem $idade anos.");
}

void main() {
  // Declaração de variáveis com tipo explícito
  int idade = 25;
  double altura = 1.75;
  String nome = "João";
  bool estaLogado = true;

  // Inferência de tipo com 'var'
  var cidade = "São Paulo"; // Dart infere que é uma String
  var temperatura = 26.5; // Dart infere que é um double

  print("Nome: $nome, Idade: $idade, Altura: $altura, Cidade: $cidade");
  print("Está logado? $estaLogado");

  // Exemplo IF-ELSE
  int nota = 85;

  if (nota >= 90) {
    print("Excelente");
  } else if (nota >= 70) {
    print("Bom");
  } else {
    print("Precisa melhorar");
  }

  // Exemplo de iteração FOR
  List<String> frutas = ["Maçã", "Banana", "Laranja", "Manga"];

  for (int i = 0; i < frutas.length; i++) {
    print("Fruta: ${frutas[i]}");
  }

// Exemplo de iteração FOR-IN
  List<String> cores = ["Vermelho", "Verde", "Azul"];
  for (var cor in cores) {
    print(cor);
  }
  // Exemplo de iteração WHILE
  int contador = 0;

  while (contador < 3) {
    print("Contador: $contador");
    contador++;
  }
  // Exemplo método 1
  int resultado = soma(5, 3);
  print("A soma é: $resultado");

  // Exemplo método - parametro opcional
  saudacao("Maria", null);
  saudacao("João", 25);

  // Exemplo de POO
  Pessoa pessoa1 = Pessoa("Ana", 30); // OBJETO 1 da classe modelo PESSOA
  pessoa1.apresentar();

  Pessoa pessoa2 = Pessoa("Carlos", 25); // OBJETO 2 da classe modelo PESSOA
  pessoa2.apresentar();
}
