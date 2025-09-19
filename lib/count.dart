import 'package:flutter/material.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  Color get purple => const Color(0xFF925c84);
  Color get teal => const Color(0xFF10A7A7);
  Color get bubbleBg => const Color(0xFFd1ecf1);

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
              child: SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                Text(
                                  'Count product inventory with the help of barcodes.',
                                  style: TextStyle(fontSize: 13, color: Color(0XFF17a2b8)),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.info),
                                  color: Color(0XFF17a2b8),
                                  onPressed: () {
                                    print('button info ditekan');
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
                      ]
                    ),
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                    // child: ElevatedButton()
                  )
                ],
              ),  
            )
          ],
      )),
    );
  }
}
