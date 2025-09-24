import 'package:flutter/material.dart';
import 'addProduk.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  // Warna tema
  Color get purple => const Color(0xFF925c84);
  Color get teal => const Color(0xFF10A7A7);
  Color get bubbleBg => const Color(0xFFd1ecf1);

  //fungsi memanggil pop up
  void _showInfoDialog(BuildContext context) {
    final List<String> points = [
      "Periodic stock audits",
      "Stock corrections due to loss, damage, or previous input errors",
      "Check the physical warehouse balance against Odoo data.",
    ];

    showDialog(
      context: context,
      barrierDismissible:
          true, //tutup pop up
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                  color: bubbleBg,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        // color: const Color(0XFFf9cf58),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.info_outline, color: teal),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "This process is carried out if:",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF10A7A7),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // close button di pojok kanan atas (opsional)
                    IconButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      icon: const Icon(Icons.close),
                      color: Colors.black54,
                      splashRadius: 18,
                    )
                  ],
                ),
              ),

              // Isi: daftar poin checklist
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
                child: Column(
                  children: points
                      .map(
                        (p) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ikon ceklis
                              Container(
                                margin: const EdgeInsets.only(top: 2),
                                child: Icon(Icons.check_circle, size: 18, color: teal),
                              ),
                              const SizedBox(width: 10),
                              // teks poin (wrap bila panjang)
                              Expanded(
                                child: Text(
                                  p,
                                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          color: Colors.white,
        ),
        backgroundColor: purple,
        centerTitle: true,
        title: const Text(
          'Physical Inventory',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: bubbleBg,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Count product inventory with the help of barcodes.',
                                    style: TextStyle(fontSize: 13, color: Color(0XFF17a2b8)),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.info_outline),
                                  color: const Color(0XFF17a2b8),
                                  onPressed: () {
                                    // <-- panggil popup custom yang mirip screenshot
                                    _showInfoDialog(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print('button setting ditekan');
                          },
                          icon: const Icon(Icons.settings),
                          color: Colors.black,
                        )
                      ]),
                      const SizedBox(height: 100),
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
                            child: Image.asset(
                              'assets/images/barcode.png',
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
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProdukPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        backgroundColor: const Color(0XFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Add Product',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        backgroundColor: const Color(0XFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
