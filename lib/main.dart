import 'package:barcode_odoo/home.dart';
import 'package:barcode_odoo/listProduk.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6E4450),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const ListProdukPage(),
    );
  }
}
