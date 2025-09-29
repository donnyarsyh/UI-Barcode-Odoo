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
  final int _totalUnit = 20;

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
                      Text(
                        'WH/IN/00001',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Row(
                        children: [
                          Icon(Icons.people_outline),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
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
                                    builder: (context) => SettingPage()));
                          },
                          icon: Icon(Icons.settings_outlined))
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

              // Bagian card produk
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
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
                          const Expanded(
                            child: Column(
                              spacing: 12,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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

                                SizedBox(
                                  width: double.infinity,
                                  child: const TextField(
                                    readOnly: false,
                                    decoration: InputDecoration(
                                      hintText: 'Serial/Lot Number',
                                      contentPadding: const EdgeInsets.all(12),
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      prefixIcon:
                                          const Icon(Icons.barcode_reader),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            spacing: 12,
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
                                  const Text(
                                    '1/20 Unit',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                    ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            width: 1, color: Colors.black)),
                                    child: Text(
                                      '-1',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            width: 1, color: Colors.black)),
                                    child: Text(
                                      '+1',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: purple,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '20',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
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
                        style: TextStyle(fontSize: 18, color: Colors.black),
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
