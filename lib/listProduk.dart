// lib/listProduk.dart
import 'package:flutter/material.dart';

class ListProdukPage extends StatefulWidget {
  const ListProdukPage({super.key});

  @override
  State<ListProdukPage> createState() => _ListProdukPageState();
}

class _ListProdukPageState extends State<ListProdukPage> {
  // warna tema sesuai desain
  Color get purple => const Color(0xFF925c84);
  Color get bubbleBg => const Color(0xFFd1ecf1);
  Color get cardBorder => const Color(0XFF57636c);

  // contoh data produk (statik, mudah diganti dengan data dinamis nanti)
  final List<Map<String, dynamic>> products = [
    {
      'title': 'Desk Combination',
      'code': '[FURN_7600]',
      'price': 'Rp 13.160.000',
      'tags': ['Color: Black', 'Legs: Aluminium'],
      'image': 'assets/images/desk_combination.jpeg',
    },
    {
      'title': 'LED Lamp',
      'code': '[FURN_0003]',
      'price': 'Rp 1.480.500',
      'tags': [],
      'image': 'assets/images/led_lamp.png',
    },
    {
      'title': 'Acoustic Bloc Screens',
      'code': '[FURN_6666]',
      'price': 'Rp 4.852.750',
      'tags': ['Color: Black'],
      'image': 'assets/images/acoustic.jpeg',
    },
    {
      'title': 'Storage Box',
      'code': '[E-COM08]',
      'price': 'Rp 246.750',
      'tags': [],
      'image': 'assets/images/storage_box.png',
    },
    // tambahkan item lain sesuai kebutuhan...
  ];

  // controller untuk search (jika mau implementasi filter nanti)
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product', style: TextStyle(color: Colors.white)),
        backgroundColor: purple,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),

      // body: safe area + column (search di atas, list di bawah)
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // --- Search bar + New button (Row)
              Row(
                children: [
                  // search field mengambil sisa ruang
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              // controller: _searchController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(12),
                                hintText: 'Search product...',
                                border: InputBorder.none,
                                isCollapsed: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      print('New button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 50),
                      textStyle: const TextStyle(fontSize: 14),
                      backgroundColor: purple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(12),
                      elevation: 0,
                    ),
                    child: const Text('New', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // --- Daftar produk (Expanded supaya fill ruang dan scrollable)
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 4, bottom: 12),
                  itemCount: products.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final p = products[index];
                    return _productCard(
                      title: p['title'] as String,
                      code: p['code'] as String,
                      price: p['price'] as String,
                      tags: List<String>.from(p['tags'] as List),
                      imagePath: p['image'] as String,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Buat tampilan kartu produk sederhana sesuai desain.
  Widget _productCard({
    required String title,
    required String code,
    required String price,
    required List<String> tags,
    required String imagePath,
  }) {
    return Container(
      // kotak putih dengan border rounded
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: cardBorder, width: 0.8),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Kiri: judul & detail (Expanded mengambil ruang utama)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // judul dengan icon bintang
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // kode produk
                Text(code, style: const TextStyle(fontSize: 12, color: Colors.black54)),

                const SizedBox(height: 8),

                // tags kecil (jika ada)
                if (tags.isNotEmpty)
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: tags.map((t) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEFE8), // warna tag contoh
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(t, style: const TextStyle(fontSize: 11)),
                      );
                    }).toList(),
                  ),

                // harga
                const SizedBox(height: 8),
                Text('Price:$price', style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Kanan: gambar produk kecil di dalam kotak rounded
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: bubbleBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                // gunakan AssetImage. Pastikan gambar ada di assets/images/product.png
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // fallback kalau gambar tidak ditemukan
                  return const Center(child: Icon(Icons.image_not_supported));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
