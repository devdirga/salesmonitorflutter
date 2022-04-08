// import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'message.dart';

class MessageDao {
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.reference().child('messages');

  void saveMessage(Message message) {
    // log("message count  " + message.count.toString());
    _messagesRef.push().set(message.toJson());
  }

  Query getMessageQuery() {
    return _messagesRef.orderByKey();
  }
}
