import 'package:dio/dio.dart';

class OncologyApiService {
  final Dio _dio = Dio();

  /// Busca os tipos principais de câncer da SEER API
  Future<List<Map<String, dynamic>>> fetchPrimaryCancerSites() async {
    const String url = 'https://api.seer.cancer.gov/rest/disease/primary_site';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is Map && data.containsKey('results')) {
          final List<dynamic> results = data['results'];
          return List<Map<String, dynamic>>.from(results);
        } else if (data is List) {
          return List<Map<String, dynamic>>.from(data);
        } else {
          throw Exception('Formato inesperado da resposta da SEER API');
        }
      } else {
        throw Exception('Erro HTTP: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao conectar à SEER API: $e');
    }
  }
}
