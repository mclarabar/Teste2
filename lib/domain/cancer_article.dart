/*class CancerArticle {
  final String location; // Ex: "Pulmão"
  final int newCases;    // Ex: 32560
  final String sex;        // Ex: "Homens" ou "Mulheres"

  CancerArticle({
    required this.location,
    required this.newCases,
    required this.sex,
  });

  factory CancerArticle.fromJson(Map<String, dynamic> json) {
    return CancerArticle(
      location: json['location'],
      newCases: json['new-cases'],
      sex: json['sex'],
    );
  }
}
*/
class CancerArticle {
  final String title;
  final String sourceName;
  final String url;
  final int newCases;

  CancerArticle({
    required this.title,
    required this.sourceName,
    required this.url,
    required this.newCases,
  });

  factory CancerArticle.fromJson(Map<String, dynamic> json) {
    return CancerArticle(
      title: json['title'] ?? '',
      sourceName: json['sourceName'] ?? '',
      url: json['url'] ?? '',
      newCases: json['newCases'] ?? '',
    );
  }
}
