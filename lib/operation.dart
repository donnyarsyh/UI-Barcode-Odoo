import 'package:barcode_odoo/delivery/delivery.dart';
import 'package:barcode_odoo/manufacturing/manufacturing.dart';
import 'package:barcode_odoo/pos/posOrder.dart';
import 'package:flutter/material.dart';
import 'receipts/receipts.dart';

// --- MODEL DATA (Model tidak berubah) ---

class Operation {
  final String title;
  final int count;
  final Widget targetPage;

  Operation({required this.title, required this.count, required this.targetPage});
}

class Warehouse {
  final String name;
  final List<Operation> operations;

  Warehouse({required this.name, required this.operations});
}
class OperationPage extends StatelessWidget {
  const OperationPage({super.key});

  Color get purple => const Color(0xFF925c84); 
  Color get bubbleBg => Color(0xFFd1ecf1); 
  
  // --- DATA DUMMY ---
  List<Warehouse> get warehouses => [
        Warehouse(
          name: 'Gudang Surabaya',
          operations: [
            Operation(title: 'RECEIPTS', count: 4, targetPage: const ReceiptsPage()),
            Operation(title: 'DELIVERY ORDERS', count: 16, targetPage: const DeliveryPage()),
            Operation(title: 'MANUFACTURING', count: 2, targetPage: const ManufacturingPage()),
            Operation(title: 'POS ORDERS', count: 1, targetPage: const PosOrderPage()),
          ],
        ),
        Warehouse(
          name: 'Gudang Kediri',
          operations: [
            Operation(title: 'RECEIPTS', count: 4, targetPage: const ReceiptsPage()),
            Operation(title: 'DELIVERY ORDERS', count: 16, targetPage: const DeliveryPage()),
            Operation(title: 'MANUFACTURING', count: 2, targetPage: const ManufacturingPage()),
            Operation(title: 'POS ORDERS', count: 1, targetPage: const PosOrderPage()),
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple, 
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(), 
        ),
        title: const Text(
          'Operations',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: bubbleBg,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Tentukan jenis aktivitas gudang yang sedang dilakukan saat menggunakan pemindai barcode.',
                style: TextStyle(
                  color: Color(0XFF17a2b8),
                  fontSize: 13,
                ),
              ),
            ),
          ),
          
          // --- SEARCH FIELD ---
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)), 
                  borderSide: BorderSide(color: Colors.grey, width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.grey, width: 0.8),
                ),
              ),
            ),
          ),
          
          // --- DAFTAR GUDANG (LISTVIEW) ---
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero, // Padding diatur di dalam kolom
              itemCount: warehouses.length,
              itemBuilder: (context, warehouseIndex) {
                final warehouse = warehouses[warehouseIndex];
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul Gudang
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        warehouse.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ),
                    
                    // Daftar Operasi di Gudang tersebut
                    ...warehouse.operations.map((operation) {
                      return _operationCard(
                        context: context,
                        operation: operation,
                        purple: purple,
                      );
                    }).toList(),
                    
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET CARD OPERASI ---
  
  Widget _operationCard({
    required BuildContext context,
    required Operation operation,
    required Color purple,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5), // Padding vertikal lebih kecil
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side:BorderSide(width: 0.5)
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        
        // Judul Operasi
        title: Text(
          operation.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),

        // Badge Angka (Trailing)
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: (operation.count > 0) ? purple : Colors.grey[400],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            operation.count.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
        
        // Navigasi
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => operation.targetPage),
          );
        },
      ),
    );
  }
}
