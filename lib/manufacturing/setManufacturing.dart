import 'package:flutter/material.dart';
import 'package:barcode_odoo/addProduk.dart';
// import '../setting.dart'; // Hapus jika tidak digunakan

class SetManufacturingPage extends StatefulWidget {
  const SetManufacturingPage({super.key});

  @override
  State<SetManufacturingPage> createState() => _SetManufacturingPageState();
}

class _SetManufacturingPageState extends State<SetManufacturingPage> {
  Color get purple => const Color(0xFF925c84);
  Color get bubbleBg => const Color(0xFFd1ecf1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          // Menghapus kurung kurawal pada onPressed jika hanya satu statement
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(
            // Menambahkan const
            Icons.arrow_back_ios_new,
            color: Colors.white,
          )
        ),
          title: const Text(
            'Manufacturing',
            style: TextStyle(color: Colors.white),
          ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    // Menambahkan const
                    'WH/MO/00001',
                    style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w900 ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    // Menambahkan const
                    '[FURN_8522] Table Top',
                    style: TextStyle(
                        fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: false,
                          decoration: InputDecoration(
                            hintText: '0',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: const BorderRadius.all(Radius.circular(12))
                            )
                          )
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 50,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2, color: purple),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text(
                          '5',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton(
                        onPressed: () {
                          print('btn ditekan');
                        },
                        child: Text(
                          '0',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFebe3e5),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                      ),),
                      const SizedBox(width: 8,),

                      Expanded(child: ElevatedButton(
                        onPressed: () {
                          print('btn ditekan');
                        },
                        child: Text(
                          '-1',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFebe3e5),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                      ),),
                      const SizedBox(width: 8,),

                      Expanded(child: ElevatedButton(
                        onPressed: () {
                          print('btn ditekan');
                        },
                        child: Text(
                          '+1',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFebe3e5),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                      ),),
                      const SizedBox(width: 8,),

                      Expanded(child: ElevatedButton(
                        onPressed: () {
                          print('btn ditekan');
                        },
                        child: Text(
                          '+5',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                      ),),            
                    ],
                  ),
                  const SizedBox(height: 12,),

                  Row(
                    children: [
                      Expanded(child: 
                        TextField(
                          readOnly: false,
                          decoration: InputDecoration(
                            hintText: 'Serial/Lot Number',
                            contentPadding:
                            const EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                            prefixIcon: const Icon(
                              Icons.barcode_reader
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ],
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
                          'Discard',
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
                          backgroundColor: purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              
            ]          
          ),
      )),
    );
  }
}
