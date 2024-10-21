import 'dart:io'; // Necessário para leitura de entrada no console

import 'Model/produto.dart';

void main() {
  List<Produto> produtos = [];

  bool continuar = true;

  // Laço para cadastrar produtos

  while (continuar) {
    print("Digite o nome do produto:");

    String nomeProduto = stdin.readLineSync()!;

    print("Digite o preço do produto:");

    double precoProduto = double.parse(stdin.readLineSync()!);

    Produto novoProduto = Produto(nomeProduto, precoProduto);

    produtos.add(novoProduto);

    print("Deseja adicionar outro produto? (s/n)");

    String resposta = stdin.readLineSync()!;

    if (resposta.toLowerCase() != 's') {
      continuar = false;
    }
  }

  // Exibindo todos os produtos cadastrados

  print("\nProdutos cadastrados:");

  for (var produto in produtos) {
    produto.mostrarProduto();
  }

  // Pesquisar um produto pelo nome

  print("\nDigite o nome do produto que deseja buscar:");

  String nomeBusca = stdin.readLineSync()!;

  bool produtoEncontrado = false;

  for (var produto in produtos) {
    if (produto.nome.toLowerCase() == nomeBusca.toLowerCase()) {
      print("Produto encontrado:");

      produto.mostrarProduto();

      produtoEncontrado = true;

      break;
    }
  }

  if (!produtoEncontrado) {
    print("Produto não encontrado.");
  }
}
