import 'package:flutter/material.dart';
import 'package:page_creators/db/dbs_helper.dart';
import 'package:page_creators/pages/aboutUsPage.dart';
import 'db/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DBHelper().exportarParaJson();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutUsPage(),
    ),
  );
}
