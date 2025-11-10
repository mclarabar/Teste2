import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../domain/cancer_article.dart';

class NewsSection extends StatelessWidget {
  final Future<List<CancerArticle>> futureNews;

  const NewsSection({super.key, required this.futureNews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'NOTÍCIAS SOBRE CÂNCER DE PULMÃO',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.indigo[900],
          ),
        ),
        const SizedBox(height: 16),
        FutureBuilder<List<CancerArticle>>(
          future: futureNews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Não foi possível carregar as notícias.'),
              );
            } else if (snapshot.hasData) {
              final articles = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: articles.length > 5 ? 5 : articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(
                        article.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(article.sourceName),
                      onTap: () async {
                        final uri = Uri.parse(article.url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Não foi possível abrir o link.'),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('Nenhuma notícia encontrada.'));
            }
          },
        ),
      ],
    );
  }
}
