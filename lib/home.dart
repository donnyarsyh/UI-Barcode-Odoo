import 'package:flutter/material.dart';
import 'operation.dart';
import 'count.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key}); //passing page agar bisa diakses oleh page lain

  // warna sesuai desain
  Color get purple => const Color(0xFF925c84); // appbar & primary button
  Color get teal => const Color(0xFF10A7A7); // secondary button & check icons
  Color get bubbleBg => const Color(0xFFd1ecf1); // top info bubble

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          color: Colors.white,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        backgroundColor: purple,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Barcode Scanner',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Konten utama: scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // bubble info
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: bubbleBg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Scan the product by clicking the product button below. You can also use a smartphone and scanning device.',
                          style: TextStyle(
                            fontSize: 13, color: Color(0XFF17a2b8)
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // area barcode besar
                      GestureDetector(
                        onTap: () {
                          // TODO: panggil fungsi scan
                        },
                        child: Column(
                          children: [
                            // kotak gambar barcode
                            Container(
                              width: media.width * 0.7,
                              height: media.width * 0.45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  // Ganti Image.asset ke Image.network jika mau
                                  child: Image.asset(
                                    'assets/barcode.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Tap to scan',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.purple,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 50),

                      // daftar tips / instruksi
                      Column(
                        children: [
                          _checkText(
                              'Scan a product or its packaging to locate it'),
                          const SizedBox(height: 8),
                          _checkText('Scan a tracking number to open it'),
                          const SizedBox(height: 8),
                          _checkText('Scan a picking to open it'),
                          const SizedBox(height: 8),
                          _checkText('Scan an operation type to start it'),
                        ],
                      ),

                      const SizedBox(height: 60), // spacing before buttons
                    ],
                  ),
                ),
              ),
            ),

            // dua tombol di bagian bawah
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OperationPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Operations',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CountPage()
                            )
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Count Inventory',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_circle, color: teal, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
