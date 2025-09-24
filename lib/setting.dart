import 'package:flutter/material.dart';
import 'addProduk.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
        title: const Text('<Name Operation>', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                const SizedBox(width: 8,),
                                Text(
                                  'Wood Corner',
                                   style: TextStyle(fontSize: 14, color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                        IconButton(onPressed: () => Navigator.of(context).maybePop(),
                        icon: Icon(Icons.close))
                      ],
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter a barcode',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  width: 1, color: Colors.grey
                                )
                              )
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: (){
                            print("Apply ditekan");
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 55),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12),
                              side: BorderSide(width: 1, color: Colors.black)
                            ),
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),

                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Icon(Icons.print, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          'Print',
                          style: TextStyle(
                            fontSize: 14, color: Colors.grey
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5,),

                    ElevatedButton(onPressed: (){
                    }, 
                    child: const Text(
                      'Print Picking Operaton',
                      style: TextStyle(fontSize: 14, color: Colors.black)
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                        side: BorderSide(width: 1, color: Colors.black)
                      )
                    )),
                    const SizedBox(height: 12),

                    ElevatedButton(onPressed: (){
                    }, 
                    child: const Text(
                      'Print Delivery Slip',
                      style: TextStyle(fontSize: 14, color: Colors.black)
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                        side: BorderSide(width: 1, color: Colors.black)
                      )
                    )),
                    const SizedBox(height: 12),

                    ElevatedButton(onPressed: (){
                    }, 
                    child: const Text(
                      'Print Barcodes',
                      style: TextStyle(fontSize: 14, color: Colors.black)
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                        side: BorderSide(width: 1, color: Colors.black)
                      )
                    )),
                    const SizedBox(height: 12,),

                    Text(
                      'operations',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(height: 5,),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton.icon(
                      onPressed: (){}, 
                      label: const Text('Cancel Transfer', style: TextStyle(fontSize: 14, color: Colors.white)),
                      icon: const Icon(Icons.delete_outline, color: Colors.white,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12)
                        ),
                      ))
                    )
                  ],
                )
              )
            ),
          ]
        )
      )
    );
  }
}
