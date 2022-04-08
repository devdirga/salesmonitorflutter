// import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

import 'message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data/message.dart';
import 'data/message_dao.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class MessageListState extends State<MessageList> {
  TextEditingController _messageController = TextEditingController();
  TextEditingController _countController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  // late TextEditingController _textController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());

    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;
    

    

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Ayam Bakar Pak Mantebs'),
      // ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.number,
              style: GoogleFonts.lato(textStyle: headline6, color: Colors.black, fontSize: 15),
              controller: _messageController,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.lato(textStyle: headline6, color: Colors.grey, fontSize: 15),
                hintText: 'Identitas...',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 25,
                  color: Colors.blue[900],
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              keyboardType: TextInputType.number,
              style: GoogleFonts.lato(textStyle: headline6, color: Colors.black, fontSize: 15),
              controller: _countController,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.lato(textStyle: headline6, color: Colors.grey, fontSize: 15),
                hintText: 'Jumlah Beli',
                prefixIcon: Icon(
                  Icons.confirmation_number_outlined,
                  size: 25,
                  color: Colors.blue[900],
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 5,),
            
            RaisedButton(
              child: Text(
                'Tambahkan',
                style: GoogleFonts.lato(textStyle: headline6, color: Colors.white, fontSize: 15),
              ),
              onPressed: (){
                _sendMessage();
              },
              color: Colors.blue,
            ),
            _getMessageList(),



           
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_canSendMessage()) {
      widget.messageDao.saveMessage(
        Message(

          _messageController.text,
          int.parse(_countController.text), 
          DateTime.now()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                // Code to execute.
              },
            ),
            content: const Text('Success insert data!'),
            duration: const Duration(milliseconds: 1500),
            width: 280.0, // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0, // Inner padding for SnackBar content.
            ),
            behavior: SnackBarBehavior.floating,
            
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
      );
      _messageController.clear();
      _countController.clear();
      setState(() {});
    }
  }

  Widget _getMessageList() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.messageDao.getMessageQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final message = Message.fromJson(json);
          return MessageWidget(snapshot.key.toString(), message.text, message.count, message.date);
        },
      ),
    );
  }

  bool _canSendMessage() => ( _messageController.text.length > 0 && _countController.text.length > 0);

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}

class MessageList extends StatefulWidget {
  MessageList({Key? key}) : super(key: key);

  final messageDao = MessageDao();

  @override
  MessageListState createState() => MessageListState();
}
