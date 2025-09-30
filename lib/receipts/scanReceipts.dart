import 'package:flutter/material.dart';
import '../setting.dart';
import '../addProduk.dart';

class ScanReceiptsPage extends StatefulWidget {
  const ScanReceiptsPage({super.key});

  @override
  State<ScanReceiptsPage> createState() => _ScanReceiptsPageState();
}

class _ScanReceiptsPageState extends State<ScanReceiptsPage> {
  Color get purple => const Color(0xFF925c84);
  Color get bubbleBg => const Color(0xFFd1ecf1);

  //variabel state untuk menyimpan jumlah unit
  int _currentUnit = 1;
  final int _totalUnit = 20; // Stok yang tersedia

  // Fungsi untuk mengubah unit (dipanggil oleh tombol)
  void _updateUnit(int change) {
    setState(() {
      int newUnit = _currentUnit + change;

      // Batasi agar tidak kurang dari 0 atau lebih dari total unit
      if (newUnit < 0) {
        _currentUnit = 0;
      } else if (newUnit > _totalUnit) {
        _currentUnit = _totalUnit;
      } else {
        _currentUnit = newUnit;
      }
    });
  }
  
  // Fungsi untuk mengatur unit ke nilai maksimum (total unit)
  void _setUnitToMax() {
    setState(() {
      _currentUnit = _totalUnit;
    });
  }

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
        title: const Text('Receipts', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'WH/IN/00001',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.people_outline),
                          const SizedBox(
                            width: 12,
                          ),
                          const Text(
                            'Wood Corner',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/barcode.png',
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SettingPage()));
                          },
                          icon: const Icon(Icons.settings_outlined))
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: bubbleBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.fullscreen, color: Colors.black),
                    SizedBox(width: 8),
                    Text(
                      'Scan a product',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: purple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0)
                  ),
                ),
                child: Row(
                  spacing: 12,
                  children: const [
                    Icon(Icons.location_pin, color: Colors.white,),
                    Text(
                      'WH/Stock',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Bagian card produk
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)
                        ),
                        border: Border.all(width: 0.5, color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [ 
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'FURN_6677',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                    Text(
                                      'Acoustic Bloc Screens (Black)',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ]
                                ),

                                const SizedBox(height: 35), // Mengganti `spacing: 28`

                                SizedBox(
                                  width: double.infinity,
                                  child: TextField(
                                    readOnly: false,
                                    decoration: InputDecoration(
                                      hintText: 'Serial/Lot Number', hintStyle: const TextStyle(fontSize: 12),
                                      contentPadding: const EdgeInsets.all(12),
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      prefixIcon:
                                          const Icon(Icons.qr_code_scanner_outlined), // Mengganti barcode_reader
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            // Menghapus `spacing: 10` karena tidak ada di `Column`
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1, color: Colors.grey),
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(12),
                                        image: const DecorationImage(
                                          image: AssetImage('assets/images/acoustic.jpeg'),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                  const SizedBox(height: 8), // Menambahkan jarak

                                  // **MODIFIKASI: Menampilkan _currentUnit**
                                  Text(
                                    '$_currentUnit/$_totalUnit Unit',
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                    ],
                              ),
                              const SizedBox(height: 10), // Mengganti `spacing: 10`
                              
                              Row(
                                children: [
                                  // **MODIFIKASI: Tombol -1**
                                  InkWell(
                                    onTap: () => _updateUnit(-1),
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                              width: 1, color: Colors.black)),
                                      child: const Text(
                                        '-1',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  // **MODIFIKASI: Tombol +1**
                                  InkWell(
                                    onTap: () => _updateUnit(1),
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                              width: 1, color: Colors.black)),
                                      child: const Text(
                                        '+1',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  // **MODIFIKASI: Tombol 20 (Set to Max)**
                                  InkWell(
                                    onTap: _setUnitToMax,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: purple,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        '$_totalUnit', // Menampilkan total unit
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddProdukPage()));
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
                        'Validate',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
