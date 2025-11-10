import 'package:dio/dio.dart';
import '../domain/cancer_article.dart';

class NewsApiService {
  final Dio _dio = Dio();

  Future<List<CancerArticle>> fetchCancerNews() async {
    const url = 'https://api.exemplo.com/noticias_cancer';
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => CancerArticle.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao carregar notícias: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar notícias: $e');
      throw Exception('Erro ao buscar notícias');
    }
  }

  Future<Map<String, CancerArticle>> fetchLungCancerEstimates() async {
    const url = 'https://observatoriodeoncologia.com.br/api/estimativas/2023';
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        List<dynamic> allEstimates = response.data;

        final maleEstimateJson = allEstimates.firstWhere(
              (e) => e['localizacao'] == 'Pulmão' && e['sexo'] == 'Homens',
          orElse: () => null,
        );

        final femaleEstimateJson = allEstimates.firstWhere(
              (e) => e['localizacao'] == 'Pulmão' && e['sexo'] == 'Mulheres',
          orElse: () => null,
        );

        if (maleEstimateJson == null || femaleEstimateJson == null) {
          throw Exception('Dados de câncer de pulmão não encontrados.');
        }

        return {
          'homens': CancerArticle.fromJson(maleEstimateJson),
          'mulheres': CancerArticle.fromJson(femaleEstimateJson),
        };
      } else {
        throw Exception('Falha ao carregar dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar estimativas: $e');
      throw Exception('Erro ao buscar estimativas de câncer');
    }
  }
}
