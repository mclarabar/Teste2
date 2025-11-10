import 'package:sqflite/sqlite_api.dart';
import '../domain/propriedade.dart';
import 'db_helper.dart';

class PropriedadesDao {
  Future<List<Propriedade>> listarPropriedades() async {
    List<Propriedade> listaPropriedades = [];
    Database db = await DBHelper().initDB();

    String sql = 'SELECT * FROM PROPRIEDADE;';
    var listResult = await db.rawQuery(sql);

    for (var json in listResult) {
      Propriedade propriedade = Propriedade.fromJson(json);
      listaPropriedades.add(propriedade);
    }

    await Future.delayed(Duration(seconds: 3));

    return listaPropriedades;

    // Propriedade(
    //   valor: '2,500',
    //   avaliacao: 5.0,
    //   datas: '12-31 Dec',
    //   local: result[0]['local'],
    //   tipoDeHost: 'Professional Host',
    //   urlImage:
    //   'https://news.airbnb.com/wp-content/uploads/sites/4/2019/06/PJM020719Q202_Luxe_WanakaNZ_LivingRoom_0264-LightOn_R1.jpg?fit=3200%2C2133',
    // )
  }
}