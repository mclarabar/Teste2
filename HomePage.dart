import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      body: ListView(
        children: [
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            children: [
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Ezequiel.png'),
                      radius: 80,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      color: Colors.white,
                      child: Text(
                        'José Ezequiel',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Lara.png'),
                      radius: 80,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      color: Colors.white,
                      child: Text(
                        'Lara Ivine',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Clara.png'),
                      radius: 80,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      color: Colors.white,
                      child: Text(
                        'Mara Clara',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/karla.png'),
                      radius: 80,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      color: Colors.white,
                      child: Text(
                        'Maria Karla',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ListView(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Digite seu texto aqui',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                maxLines: 20,

              ),
            ],
          ),
        ],
      ),
    );
  }
}
