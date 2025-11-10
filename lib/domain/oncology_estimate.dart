class OncologyEstimate {
  final String tipoCancer;
  final String estimativa;
  final String ano;
  final String localizacao;
  final String sexo;

  OncologyEstimate({
    required this.tipoCancer,
    required this.estimativa,
    required this.ano,
    required this.localizacao,
    required this.sexo,
  });

  factory OncologyEstimate.fromJson(Map<String, dynamic> json) {
    return OncologyEstimate(
      tipoCancer: json['tipo_cancer'] ?? 'Tipo não especificado',
      estimativa: json['estimativa']?.toString() ?? 'N/A',
      ano: json['ano']?.toString() ?? 'Desconhecido',
      localizacao: json['localizacao'] ?? 'Brasil',
      sexo: json['sexo'] ?? 'Ambos',
    );
  }
}