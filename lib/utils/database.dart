import 'package:firebase_database/firebase_database.dart';

final DatabaseReference _messagesRef = FirebaseDatabase.instance.reference().child('messages');

class Database {
  static String? Uid;
  static Future<void> updateItem({
    required String key,
    required int count,
    required String date,
    required String text,
  }) async {
    
    Map<String, dynamic> data = <String, dynamic>{
      "count": count,
      "text": text,
      "date":date,
    };

    // DataSnapshot snapshot = await _messagesRef.child(key).once();


    _messagesRef.child(key).update(data).then((value) {
      print('success update data');
    });
  }
}