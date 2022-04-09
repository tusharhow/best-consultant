import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class BottomChatBar extends StatefulWidget {
  const BottomChatBar({Key? key}) : super(key: key);

  @override
  _BottomChatBarState createState() => _BottomChatBarState();
}

class _BottomChatBarState extends State<BottomChatBar> {
  final TextEditingController textController = TextEditingController();

  @override
  // Clean up on destroy
  void dispose() {
    textController.dispose();
    super.dispose();
  }

// send message to firebase
  void sendMessage() {
    final String message = textController.text;
    if (message.isNotEmpty) {
      FirebaseFirestore.instance.collection('messages').add({
        'text': message,
        'from': "tmah@gmail.com",
        "reply": "",
        'createdAt': Timestamp.now(),
        'reciver':
            "https://images.unsplash.com/photo-1574701148212-8518049c7b2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YmVhdXRpZnVsJTIwd29tYW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
        'sender':
            "https://images.unsplash.com/photo-1597248374161-426f0d6d2fc9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"
      });
      textController.clear();
    }
  }

  // get message from firebase
  Stream<QuerySnapshot> getMessages() {
    return FirebaseFirestore.instance
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .limit(20)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7161EF),
      body: Column(
        children: [
          Spacer(),
          SizedBox(
            height: 400,
            child: StreamBuilder<QuerySnapshot>(
              stream: getMessages(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot doc = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  doc['sender'],
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                height: doc['text'].length > 20
                                    ? 40
                                    : doc['text'].length > 10
                                        ? 30
                                        : 30,
                                width: doc['text'].length > 20
                                    ? 200
                                    : doc['text'].length > 10
                                        ? 150
                                        : 100,
                                child: Text(
                                  doc['reply'] == ""
                                      ? "typing.."
                                      : doc['reply'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                height: doc['text'].length > 20
                                    ? 40
                                    : doc['text'].length > 10
                                        ? 30
                                        : 30,
                                width: doc['text'].length > 20
                                    ? 200
                                    : doc['text'].length > 10
                                        ? 150
                                        : 100,
                                decoration: BoxDecoration(
                                  color: Color(0xffF6C54D),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    doc['text'],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  doc['reciver'],
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                )),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
            height: 50,
            child: TextField(
              cursorColor: Colors.lightBlue,
              controller: textController,
              textAlign: TextAlign.left,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              keyboardType: TextInputType.text,
              onEditingComplete: sendMessage,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    sendMessage();
                    // auto scroll to bottom of chat screen
                  },
                ),
                filled: true,
                fillColor: Colors.black38,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                labelText: 'Enter message',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
