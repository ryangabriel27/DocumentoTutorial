import 'dart:convert'; // Necessário para converter dados JSON
import 'package:http/http.dart' as http;
import 'package:projeto_filme_api/Model/filme_model.dart'; // Biblioteca HTTP para realizar requisições


class FilmeService {
  // URL base da API
  final String baseUrl = 'http://192.168.1.15:3000/filmes';


  // Método para buscar a lista de filmes
  Future<List<Filme>> getFilmes() async {
    final url = Uri.parse(baseUrl); // Constrói a URL
    final response = await http.get(url); // Requisição GET para buscar filmes


    if (response.statusCode == 200) {
      // Se a requisição foi bem-sucedida
      List<dynamic> jsonList = jsonDecode(response.body); // Decodifica o JSON
      return jsonList.map((json) => Filme.fromJson(json)).toList(); // Mapeia a lista de JSON para objetos Filme
    } else {
      throw Exception('Failed to load filmes'); // Exceção em caso de erro
    }
  }


  // Método para criar um novo filme
  Future<Filme> postFilme(Filme filme) async {
    final url = Uri.parse(baseUrl); // Constrói a URL
    final response = await http.post(
      url,
      body: jsonEncode(filme.toJson()), // Converte o objeto Filme para JSON
      headers: {'Content-Type': 'application/json'}, // Cabeçalhos da requisição
    );


    if (response.statusCode == 201) {
      // Se o filme foi criado com sucesso
      return Filme.fromJson(jsonDecode(response.body)); // Retorna o novo filme criado
    } else {
      throw Exception('Failed to create filme'); // Exceção em caso de erro
    }
  }


  // Método para deletar um filme por ID
  Future<void> deleteFilme(String id) async {
    final url = Uri.parse('$baseUrl/$id'); // Constrói a URL com o ID do filme
    final response = await http.delete(url); // Requisição DELETE


    if (response.statusCode != 200) {
      throw Exception('Failed to delete filme'); // Exceção em caso de erro
    }
  }


}
