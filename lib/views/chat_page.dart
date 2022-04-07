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
      });
      textController.clear();
    }
  }

  // get message from firebase
  Stream<QuerySnapshot> getMessages() {
    return FirebaseFirestore.instance
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .limit(20)
        .snapshots();
  }

  // get admin messages from firebase
  Stream<QuerySnapshot> getAdminMessages() {
    return FirebaseFirestore.instance
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .limit(20)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // show admin messages
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getMessages(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot doc = snapshot.data!.docs[index];
                      return ListTile(
                        title: Text(doc['reply']),
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
          Expanded(
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
                            // Text(
                            //   doc['from'],
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     color: Colors.black,
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Text(
                              doc['text'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
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

          SizedBox(
            height: 250,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xff161616),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    constraints: const BoxConstraints(
                      maxWidth: 275,
                    ),
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
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xff212121),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        labelText: 'Enter message',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: EdgeInsets.only(
                          left: 20.0,
                          right: 10.0,
                          top: 0.0,
                          bottom: 0.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 50,
                    child: FloatingActionButton(
                      onPressed: () {
                        sendMessage();
                      },
                      elevation: 8.0,
                      backgroundColor: Colors.lightBlue,
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
