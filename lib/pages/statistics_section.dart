import 'package:flutter/material.dart';
import 'oncology_api_service.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final service = OncologyApiService();

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: service.fetchPrimaryCancerSites(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.purple),
          );
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Erro ao carregar dados: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Nenhuma informação disponível no momento.'),
          );
        }

        final sites = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tipos de Câncer (Fonte: SEER - EUA)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 10),
              ...sites.take(20).map((site) => Card(
                color: const Color(0xFFF3E8FF),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.local_hospital,
                      color: Colors.deepPurple),
                  title: Text(
                    site['label'] ?? 'Nome não informado',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3A0CA3)),
                  ),
                  subtitle: Text(
                    'Código: ${site['value'] ?? 'Sem código'}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
              )),
            ],
          ),
        );
      },
    );
  }
}
