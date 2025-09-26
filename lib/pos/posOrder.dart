import 'package:barcode_odoo/pos/scanPosOrder.dart';
import 'package:flutter/material.dart';

class PosOrderPage extends StatefulWidget {
  const PosOrderPage({super.key});

  @override
  State<PosOrderPage> createState() => _PosOrderPageState();
}

class _PosOrderPageState extends State<PosOrderPage> {
  Color get purple => const Color(0xFF925c84);
  Color get bubbleBg => const Color(0xFFd1ecf1);
  Color get cardBorder => const Color(0XFF57636c);

  List<String> get receipts => [
        'WH/POS/00001',
      ];

  // state yang menyimpan segmen aktif: 0=All, 1=To Do, 2=Ready
  int _selectedSegment = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('PoS Order', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('YourCompany', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 12),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(0, 50),
                        backgroundColor: purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      child: const Text('New',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                        child: TextField(
                      readOnly: false,
                      decoration: InputDecoration(
                          hintText: 'Search...',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          prefixIcon: Icon(Icons.search, color: Colors.grey)),
                    )),
                  ],
                ),

                const SizedBox(height: 12),

                // Segmented buttons: clickable
                Row(
                  children: [
                    // call helper with index 0
                    _smallSegment('All', 0),
                    const SizedBox(width: 8),
                    _smallSegment('To Do', 1),
                    const SizedBox(width: 8),
                    _smallSegment('Ready', 2),
                  ],
                ),
                const SizedBox(height: 12),

                // Info bubble
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(12, 12, 20, 12),
                  decoration: BoxDecoration(
                      color: bubbleBg, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        'Scan a transfer, a product, or a lot to filter your records',
                        style:
                            TextStyle(fontSize: 13, color: Color(0XFF17a2b8)),
                      )),
                      // const Icon(Icons.qr_code_scanner, color: Colors.blue),
                      Image.asset(
                        'assets/images/barcode.png',
                        width: 50,
                        height: 50,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                Column(
                  children: receipts.map((code) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScanPosOrderPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 0.5, color: cardBorder),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star_border, color: Colors.grey),
                            const SizedBox(width: 12),
                            // Code & place
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(code,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  const Text('Wood Corner',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Text('Ready',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '25/09/2025',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Helper: membuat segmen button yang bisa diklik.
  /// index: identitas segmen. Saat diketuk, _selectedSegment di-set ke index tersebut.
  Widget _smallSegment(String label, int index) {
    final bool active = _selectedSegment == index;

    return GestureDetector(
      onTap: () {
        // Ubah segmen aktif dan refresh UI
        setState(() {
          _selectedSegment = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? purple : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: active ? purple : Colors.black),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: active ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
