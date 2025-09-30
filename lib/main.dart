// File: lib/main.dart

import 'package:flutter/material.dart';

// Import semua halaman dan model yang Anda gunakan
import 'package:barcode_odoo/home.dart';
import 'package:barcode_odoo/operation.dart';
import 'package:barcode_odoo/pos/posOrder.dart';



void main() {
  // Pastikan inisialisasi binding Flutter sudah selesai sebelum menjalankan aplikasi
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner UI',
      debugShowCheckedModeBanner: false,
      
      // SOLUSI UNTUK MASALAH 'ZOOM' TAMPILAN
      builder: (context, child) {
        // Ambil data MediaQuery saat ini
        final mediaQueryData = MediaQuery.of(context);
        
        // Kembalikan widget MediaQuery yang baru dengan skala teks diatur ke 'noScaling'.
        // Ini akan mengabaikan pengaturan 'Font Size' dan 'Display Zoom' di HP Anda.
        return MediaQuery(
          data: mediaQueryData.copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        );
      },

      theme: ThemeData(
        // Tema warna ungu yang Anda definisikan (0xFF6E4450)
        primaryColor: const Color(0xFF6E4450), 
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        
        // Definisi tema App Bar untuk konsistensi di seluruh aplikasi
        appBarTheme: AppBarTheme(
          color: const Color(0xFF6E4450), // Sesuai primaryColor
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      
      // Halaman Utama
      home: const HomePage(),

      // Jika Anda ingin mendefinisikan rute (misalnya: untuk OperationPage)
      /* routes: {
        '/home': (context) => const HomePage(),
        '/operations': (context) => const OperationPage(),
      },
      initialRoute: '/home',
      */
    );
  }
}
