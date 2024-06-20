import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
//ສ້າງ messageTxtController
  final TextEditingController _messageTxtController = TextEditingController();

//ສັ່ງ dispose ເພື່ອໃຫ້ບໍ່ເກັບຄ່າໃນໜ່ວຍຄວາມຈຳເວລາປິດໜ້ານີ້
  @override
  void dispose() {
    _messageTxtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Screen"),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Text("Chat text"),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageTxtController,
                    decoration: const InputDecoration(hintText: "Type message"),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      //ສັ່ງໃຫ້ເພີ່ມຂໍ້ມູນເຂົ້າໃນ Firebase
                      sendMessage();
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendMessage() async {
    //ຮັບຂໍ້ຄວາມຈາກກ່ອງ
    final message = _messageTxtController.text.trim();

    //ສົ່ງຂໍ້ຄວາມໄປທີ່ firebase
    try {
      await FirebaseFirestore.instance.collection('chat').add({
        'message': message,
        'owner': 'Song',
      });
    } catch (e) {
      //ຖ້າເກີດຂໍ້ຜິດພາດໃຫ້ສະແດງອອກມາທາງ Terminal
      print('Error: ${e}');
    }

    //ລົບຂໍ້ຄວາມອອກຈາກກ່ອງ
    _messageTxtController.clear();
    print(message);
  }
}
