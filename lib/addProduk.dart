import 'package:flutter/material.dart';
import 'listProduk.dart';

class AddProdukPage extends StatefulWidget {
  const AddProdukPage({super.key});

  @override
  State<AddProdukPage> createState() => _AddProdukPageState();
}

class _AddProdukPageState extends State<AddProdukPage> {
  Color get purple => const Color(0xFF925c84);
  Color get teal => const Color(0xFF10A7A7);
  Color get bubbleBg => const Color(0xFFd1ecf1);

  @override
  Widget build(BuildContext context) {
    // final media = MediaQuery.of(context).size;

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
          'Add Product',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // GestureDetector membungkus Container sebagai child
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigasi ke ListProdukPage saat area Product diklik
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ListProdukPage(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                ),
                                child: const Text(
                                  'Product',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                hintText: '0',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.black
                                  )
                                ),
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                              ),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0XFFebe3e5),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1, //seberapa lebar shadow
                                    blurRadius: 1, //tingkatan blur
                                    offset: const Offset(1, 1) //letak shadow x,y
                                  )
                                ],
                              ),
                              child: const Text('0',
                                  style:
                                      TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.black)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0XFFebe3e5),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1, //seberapa lebar shadow
                                    blurRadius: 1, //tingkatan blur
                                    offset: const Offset(1, 1) //letak shadow x,y
                                  )
                                ],
                              ),
                              child: const Text('-1',
                                  style:
                                      TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.black)),
                            ),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0XFFebe3e5),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1, //seberapa lebar shadow
                                    blurRadius: 1, //tingkatan blur
                                    offset: const Offset(1, 1) //letak shadow x,y
                                  )
                                ],
                              ),
                              child: const Text('+1',
                                  style:
                                      TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.black)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Icon(Icons.qr_code, color: Colors.grey),
                          SizedBox(width: 12),
                          Text('Serial/Lot Number',
                              style: TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Serial/Lot Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  
                                ),
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  )
                                )
                              ),
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print("Discard ditekan");
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 60), 
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                      child: const Text(
                        'Discard',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print("Confirm ditekan");
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 60),
                        backgroundColor: purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(fontSize: 14, color: Colors.white),
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
