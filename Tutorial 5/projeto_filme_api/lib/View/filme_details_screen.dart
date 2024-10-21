import 'package:flutter/material.dart';
import 'package:projeto_filme_api/Model/filme_model.dart'; // Importa o pacote de widgets do Flutter


// Tela de detalhes do filme
class FilmeDetailsScreen extends StatelessWidget {
  Filme filme; // Objeto filme que contém os detalhes a serem exibidos
  FilmeDetailsScreen({required this.filme}); // Recebe o objeto filme através do construtor


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Filme - ${filme.nome}"), // Exibe o nome do filme no título da AppBar
      ),
      body: Center(
        child: Column(
          children: [
            // Exibe os detalhes do filme como nome, ano, categoria, duração e classificação
            Text("Nome do filme: ${filme.nome}"),
            Text("Ano do filme: ${filme.ano}"),
            Text("Categoria do filme: ${filme.categoria}"),
            Text("Duração do filme: ${filme.duracao}min"),
            Text("Nota do filme: ${filme.classificacao} /10 ★"),
          ],
        ),
      ),
    );
  }
}
