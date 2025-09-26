import 'package:flutter/material.dart';
import 'addProduk.dart';
import 'setting.dart';

class NewProductPage extends StatefulWidget {
  const NewProductPage({super.key});

  @override
  State<NewProductPage> createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  Color get purple => const Color(0xFF925c84);
  Color get bubbleBg => const Color(0xFFd1ecf1);
  Color get cardBorder => const Color(0XFF57636c);

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
          title: const Text('<Name Operation>',
              style: TextStyle(color: Colors.white)),
        ),
        body: SafeArea(
          child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WH/XX/00001',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Row(
                            children: [
                              Icon(Icons.people_outline),
                              const SizedBox(width: 12,),
                              Text(
                                'Wood Corner',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              )
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingPage()
                            )
                          );
                        },
                        icon: Icon(Icons.settings))
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: bubbleBg,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/barcode2.png',
                          width: 35,
                          height: 25,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Scan a Product',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/barcode.png',
                    width: 250,
                    height: 250,
                  ),
                  Text(
                    'Tap to scan',
                    style: TextStyle(
                        fontSize: 14,
                        color: purple,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
              child: Row(
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
            )
          ],
        )));
  }
}
