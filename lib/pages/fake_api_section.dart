import 'package:flutter/material.dart';
import '../services/fake_api_service.dart';

class FakeApiSection extends StatefulWidget {
  const FakeApiSection({super.key});

  @override
  State<FakeApiSection> createState() => _FakeApiSectionState();
}

class _FakeApiSectionState extends State<FakeApiSection> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: FakeApiService().fetchCreatorsFromDatabase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.deepPurple));
        } else if (snapshot.hasError) {
          return Text('Erro ao carregar dados: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('Nenhum dado encontrado no banco local.');
        }

        final criadores = snapshot.data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nossa Equipe',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3A0CA3),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 12),
            ...criadores.take(4).map((c) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF3E8FF),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(c['image']),
                  radius: 28,
                ),
                title: Text(
                  c['nome'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5E17EB),
                  ),
                ),
                subtitle: const Text(
                  'Integrante do Projeto',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                 trailing: IconButton(onPressed: (){

                 }, icon: Icon(Icons.pin_drop_rounded))
                ),




              ),
            ),
          ],
        );
      },
    );
  }


  Future<void> onPressedMaps() async {
    List<Location> locations = await locationFromAddress(widget.propriedade.local);

    if (locations.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            print('lat: ${locations[0].latitude} | long: ${locations[0].longitude}');

            return GoogleMapsPage(
              latLong: LatLng(
                locations[0].latitude,
                locations[0].longitude,
              ),
            );
          },
        ),
      );
    } else {
      SnackBar snackBar = SnackBar(content: Text('Local não encontrado!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }


}
