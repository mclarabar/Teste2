import 'package:flutter/material.dart';
import '../services/fake_api_service.dart';
import '../services/news_api_service.dart';
import '../domain/cancer_article.dart';
import 'news_section.dart';
import 'statistics_section.dart';
import 'project_intent.dart';
import 'fake_api_section.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  late Future<List<Map<String, dynamic>>> futureCriadores;
  late Future<List<CancerArticle>> futureNews;

  @override
  void initState() {
    super.initState();
    //futureCriadores = FakeApiService().fetchCreatorsOnline();
    futureNews = NewsApiService().fetchCancerNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: const Text(
            'CONHECENDO OS CRIADORES',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xFFC49CE8),

        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const FakeApiSection(),
            const SizedBox(height: 24),
            const ProjectIntentSection(),
            const SizedBox(height: 24),
            NewsSection(futureNews: futureNews),
            const StatisticsSection(),
          ],
        ),
      ),
    );
  }
}
