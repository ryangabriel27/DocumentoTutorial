import 'package:flutter/material.dart';
import 'package:projeto_filme_api/View/cadastro_screen.dart';
import 'package:projeto_filme_api/View/filme_screen.dart';



void main() {
  runApp(MyApp()); // Inicializa o aplicativo chamando a classe MyApp
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto Filmes API", // Define o título do aplicativo
      home: FilmeScreen(), // Define a tela inicial como FilmeScreen
      debugShowCheckedModeBanner: false, // Remove o banner de debug
      routes: {
        '/home': (context) => FilmeScreen(), // Rota para a tela de filmes
        '/cadastro': (context) => CadastroScreen() // Rota para a tela de cadastro
      },
    );
  }
}
