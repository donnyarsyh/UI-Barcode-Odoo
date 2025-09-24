import 'package:barcode_odoo/delivery.dart';
import 'package:barcode_odoo/manufacturing.dart';
import 'package:barcode_odoo/posOrder.dart';
import 'package:flutter/material.dart';
import 'receipts.dart';
import 'posOrder.dart';

class OperationPage extends StatelessWidget {
  const OperationPage({super.key});

  // Warna tema yang dipakai di design
  Color get purple => const Color(0xFF925c84);
  Color get bubbleBg => const Color(0xFFd1ecf1);
  Color get cardBorder => const Color(0XFF57636c);

  // Contoh data statis untuk tampilan
  List<Map<String, dynamic>> get items => [
        {'title': 'RECEIPTS', 'count': 4},
        {'title': 'DELIVERY ORDERS', 'count': 16},
        {'title': 'MANUFACTURING', 'count': 2},
        {'title': 'POS ORDERS', 'count': 1},
      ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: purple,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 20, color: Colors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Operations',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Info bubble
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: bubbleBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Determine the type of warehouse activity being performed when using a barcode scanner.',
                  style: TextStyle(fontSize: 13, color: Color(0XFF17a2b8)),
                ),
              ),
            ),

            // Search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey, width: 0.5),
                  color: const Color(0XFFf1f4f8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    // TextField
                    const Expanded(
                      child: TextField(
                        readOnly: false,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),

            // List kartu operasi — gunakan Expanded agar memenuhi sisa layar
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView.separated(
                  // padding: const EdgeInsets.only(top: 0, bottom: 0),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final it = items[index];
                    return _operationCard(
                      context: context,
                      title: it['title'] as String,
                      count: it['count'] as int,
                      width: width,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _operationCard({
    required BuildContext context,
    required String title,
    required int count,
    required double width,
  }) {
    return InkWell(
      onTap: () {
        if (title == 'RECEIPTS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReceiptsPage()),
          );
        }
        if (title == 'DELIVERY ORDERS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DeliveryPage()),
          );
        }
        if (title == 'MANUFACTURING') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ManufacturingPage()),
          );
        }
        if (title == 'POS ORDERS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PosOrderPage()),
          );
        }
      },
      child: Container(
        width: width,
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: cardBorder),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
