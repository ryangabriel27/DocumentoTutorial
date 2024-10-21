import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_filme_api/Controller/filme_controller.dart';
import 'package:projeto_filme_api/Model/filme_model.dart';



class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});


  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}


class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>(); // Chave para controlar o estado do formulário
  final FilmeController _controller = FilmeController(); // Instância do controller de filmes


  // Controllers para capturar e controlar os inputs do formulário
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _classificacaoController = TextEditingController();


  @override
  void initState() {
    // Chama o método que carrega filmes a partir do serviço ao inicializar a tela
    _controller.getFromFilmeFromService();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'), // Título da página de cadastro
      ),
      body: Center(
        child: SingleChildScrollView( // Permite rolagem caso o conteúdo da tela seja maior que a tela
          child: Form(
            key: _formKey, // Atribui a chave do formulário
            child: Padding(
              padding: EdgeInsets.all(15), // Espaçamento ao redor do formulário
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Campo para o nome do filme
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome do filme',
                    ),
                    validator: (value) {
                      // Valida se o campo está vazio
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira o nome do filme';
                      } else {
                        return null;
                      }
                    },
                    controller: _nomeController, // Controlador do input de nome
                  ),
                  SizedBox(height: 20), // Espaçamento entre os campos


                  // Campo para a categoria do filme
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Categoria do filme',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira a categoria do filme';
                      } else {
                        return null;
                      }
                    },
                    controller: _categoriaController,
                  ),
                  SizedBox(height: 20),


                  // Campo para a duração do filme
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Duração',
                    ),
                    keyboardType: TextInputType.number, // Define o teclado numérico
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly // Aceita apenas dígitos
                    ],
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira a duração do filme em minutos';
                      } else {
                        return null;
                      }
                    },
                    controller: _duracaoController,
                  ),
                  SizedBox(height: 20),


                  // Campo para o ano de lançamento
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ano',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira o ano de lançamento do filme';
                      } else {
                        return null;
                      }
                    },
                    controller: _anoController,
                  ),
                  SizedBox(height: 20),


                  // Campo para a nota de classificação do filme
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nota',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Por favor, insira a sua classificação de 0 a 10 do filme';
                      } else {
                        return null;
                      }
                    },
                    controller: _classificacaoController,
                  ),
                  SizedBox(height: 20),


                  // Botão para cadastrar o filme
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _cadastrarFilme(); // Chama a função de cadastro se o formulário for válido
                      }
                    },
                    child: Text("Cadastrar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  // Função que cria um objeto Filme a partir dos dados inseridos no formulário
  Filme getFilmes() {
    return Filme(
      nome: _nomeController.text,
      categoria: _categoriaController.text,
      duracao: int.parse(_duracaoController.text),
      ano: int.parse(_anoController.text),
      classificacao: int.parse(_classificacaoController.text),
    );
  }


  // Função para limpar os campos do formulário após o cadastro
  void limpar() {
    _nomeController.clear();
    _categoriaController.clear();
    _duracaoController.clear();
    _anoController.clear();
    _classificacaoController.clear();
    setState(() {}); // Atualiza o estado para refletir as mudanças
  }


  // Função que valida e cadastra o filme, verificando se ele já está cadastrado
  void _cadastrarFilme() {
    bool verificaFilme = false;


    // Verifica se o filme já existe na lista de filmes cadastrados
    for (int i = 0; i < _controller.listFilmes.length; i++) {
      if (_nomeController.text.trim().toLowerCase() ==
          _controller.listFilmes[i].nome.trim().toLowerCase()) {
        verificaFilme = true;
        break;
      }
    }


    // Se o filme não existir, cadastra o novo filme
    if (!verificaFilme) {
      _controller.addFilme(getFilmes()); // Adiciona o filme ao controller
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Filme cadastrado com sucesso!'),
          duration: Duration(seconds: 2),
        ),
      );
      limpar(); // Limpa o formulário após o cadastro bem-sucedido
      setState(() {
        Navigator.pushNamed(context, '/home'); // Navega para a tela inicial após o cadastro
      });
    } else {
      // Se o filme já estiver cadastrado, exibe uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Filme já cadastrado!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
