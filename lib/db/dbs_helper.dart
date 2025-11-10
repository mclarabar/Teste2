import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'db_helper.dart';

extension DBExport on DBHelper {
  Future<void> exportarParaJson() async {
    final db = await initDB();
    final dados = await db.query('Propriedade');

    final jsonData = {'criadores': dados};

    // Cria arquivo local db.json
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/db.json');
    await file.writeAsString(jsonEncode(jsonData));

    print('Arquivo JSON exportado em: ${file.path}');
  }
}
