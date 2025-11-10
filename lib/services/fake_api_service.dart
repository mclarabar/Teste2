import 'package:dio/dio.dart';
import '../db/propriedades_dao.dart';
import '../domain/propriedade.dart';

class FakeApiService {
  final PropriedadesDao _dao = PropriedadesDao();
  final Dio _dio = Dio();

  final String baseUrl = 'https://my-json-server.typicode.com/mclarabar/fake_api';

  Future<List<Map<String, dynamic>>> fetchCreatorsOnline() async {
    try {
      final response = await _dio.get('$baseUrl/criadores');

      if (response.statusCode == 200) {
        print('Dados carregados da API online.');
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        throw Exception('Erro ao carregar criadores da API.');
      }
    } catch (e) {
      print('Erro ao acessar API online: $e');
      print('Carregando dados do banco local como alternativa...');
      return await fetchCreatorsFromDatabase();
    }
  }

  Future<List<Map<String, dynamic>>> fetchCreatorsFromDatabase() async {
    final List<Propriedade> propriedades = await _dao.listarPropriedades();

    return propriedades.map((p) => {
      'id': p.id,
      'image': p.image ?? '',
      'nome': p.nome ?? '',
      'local': p.local ?? '',
    }).toList();
  }
}
