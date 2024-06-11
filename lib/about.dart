import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  // ໂຕປ່ຽນເກັບຄ່າການຄິຼກ
  bool isClicked = false;

  // ກຳນົດ state ເລີ່ມຕົ້ນໃຫ້ເປັນຄ່າ false
  @override
  void initState() {
    isClicked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Page")),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              //ປ່ຽນ state ຂອງ isClicked
              setState(() {
                isClicked = !isClicked;
              });
            },
            child: Text(
              "Change Color",
              style: TextStyle(color: isClicked ? Colors.red : Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
