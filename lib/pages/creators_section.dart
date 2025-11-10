import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../db/propriedades_dao.dart';
import '../domain/propriedade.dart';
import '../widget/card_propriedade.dart';

class CreatorsSection extends StatelessWidget {
  const CreatorsSection({super.key, required Future<List<Propriedade>> futurePropriedades});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Propriedade>>(
      future: PropriedadesDao().listarPropriedades(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final lista = snapshot.data!;
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            itemCount: lista.length,
            itemBuilder: (context, i) => CardPropriedade(propriedade: lista[i]),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}