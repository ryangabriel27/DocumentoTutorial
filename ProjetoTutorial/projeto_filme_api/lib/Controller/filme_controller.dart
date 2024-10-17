import 'package:projeto_filme_api/Model/filme_model.dart';
import 'package:projeto_filme_api/Service/filme_service.dart';

class FilmeController {
  List<Filme> listFilmes = []; // Lista que armazena os filmes recuperados da API
  final FilmeService _service = FilmeService(); // Instância do serviço de filme


  // Método para buscar filmes do serviço
  Future<void> getFromFilmeFromService() async {
    try {
      listFilmes.clear(); // Limpa a lista antes de adicionar novos filmes
      listFilmes = await _service.getFilmes(); // Chama o serviço para buscar filmes
      print('List filmes: $listFilmes'); // Log para ver a lista de filmes
    } catch (e) {
      print(e); // Log para ver o erro em caso de falha
    }
  }


  // Método para adicionar um filme
  Future<void> addFilme(Filme filme) async {
    try {
      Filme newFilme = await _service.postFilme(filme); // Chama o serviço para adicionar o filme
      listFilmes.add(newFilme); // Adiciona o novo filme na lista
      print('Filme adicionado: $newFilme'); // Log para verificar o filme adicionado
    } catch (e) {
      print(e); // Log para capturar o erro
    }
  }


  // Método para deletar um filme
  Future<void> deleteFilme(String id) async {
    try {
      await _service.deleteFilme(id); // Chama o serviço para deletar o filme
      listFilmes.removeWhere((filme) => filme.id == id); // Remove o filme da lista localmente
      print('Filme excluido: $id'); // Log para verificar o filme excluído
    } catch (e) {
      print(e); // Log para capturar o erro
    }
  }
}
