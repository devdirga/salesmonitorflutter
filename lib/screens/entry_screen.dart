import 'package:flutter_application_1/data/message.dart';
import 'package:flutter_application_1/data/message_dao.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen>{
  TextEditingController textCtrl = TextEditingController();
  TextEditingController countCtrl = TextEditingController();
  late FocusNode foc;
  @override
  void initState() {
    super.initState();
    foc =  FocusNode();
    WidgetsBinding.instance!.addPostFrameCallback((_){
      FocusScope.of(context).requestFocus(foc);
    });
  }
  @override
  void dispose() {
    foc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              cursorColor: Colors.black,
              focusNode: foc,
              keyboardType: TextInputType.number,
              style: GoogleFonts.lato(color: Colors.black, fontSize: 15),
              controller: textCtrl,
              decoration: InputDecoration(
                focusColor: Colors.black,
                hoverColor: Colors.black,
                hintStyle: GoogleFonts.lato(color: Colors.grey, fontSize: 15),
                hintText: 'Identitas...',
                prefixIcon: Icon(Icons.account_circle,size: 25,color: Colors.blue[900]),
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15)
              )
            ),
            SizedBox(height: 5),
            TextFormField(
              keyboardType: TextInputType.number,
              style: GoogleFonts.lato(color: Colors.black, fontSize: 15),
              controller: countCtrl,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.lato(color: Colors.grey, fontSize: 15),
                hintText: 'Jumlah Beli',
                prefixIcon: Icon(
                  Icons.confirmation_number_outlined,
                  size: 25,
                  color: Colors.blue[900],
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15)
              )
            ),
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: (){
                  _sendMessage();
                },
                label: Text('Tambah'),
                icon: Icon(Icons.add_circle_outline),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                )    
              )
            )
          ]
        )
      )
    );
  }

  void _sendMessage() {
    if ( textCtrl.text.length > 0 && countCtrl.text.length > 0) {
      new MessageDao().saveMessage(Message(textCtrl.text,int.parse(countCtrl.text),DateTime.now()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            action: SnackBarAction(label: 'OK',onPressed: () {}),
            content: const Text('Success'),
            duration: const Duration(milliseconds: 100),
            behavior: SnackBarBehavior.floating
          )
      );
      textCtrl.clear();
      countCtrl.clear();
      foc.requestFocus();
    }
  }

}