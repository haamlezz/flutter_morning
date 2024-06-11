import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isLoved = false;

  @protected
  late QrCode qrCode;

  @protected
  late QrImage qrImage;

  @protected
  late PrettyQrDecoration decoration;

  @override
  void initState() {
    super.initState();

    qrCode = QrCode.fromData(
      data: 'https://pub.dev/packages/pretty_qr_code',
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    qrImage = QrImage(qrCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image
            Container(
              color: Colors.red.shade100,
              child: Image.asset("./assets/images/1.jpg"),
            ),

            //Reaction & Like numbers
            Container(
              padding: const EdgeInsets.only(right: 10),
              height: 50,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //icon love & comment
                  Container(
                    child: Row(children: [
                      //icon button love
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isLoved = !isLoved;
                          });
                        },
                        icon: isLoved
                            ? Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                      ),

                      //icon button comment
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_bubble_outline),
                      )
                    ]),
                  ),
                  //like number
                  const Text("100M likes")
                ],
              ),
            ),

            //Description
            Container(
              height: 200,
              width: 500,
              color: Colors.amber.shade300,
              child: const Text("I love you!!!"),
            ),

            //Qr Code
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PrettyQrView(qrImage: qrImage),
            )
          ],
        ),
      ),
    );
  }
}
