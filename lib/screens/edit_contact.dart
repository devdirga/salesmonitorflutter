import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/ProgressBar.dart';
import 'package:google_fonts/google_fonts.dart';

class EditContact extends StatefulWidget{
  final String contactKey;
  EditContact({required this.contactKey});
  @override
  State<StatefulWidget> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact>{
  late TextEditingController textCtrl, countCtrl;
  late DatabaseReference _ref;
  late ProgressBar progressBar;
  @override
  void initState() {
    super.initState();
    textCtrl = TextEditingController();
    countCtrl = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('messages');
    getContactDetail();
    progressBar = ProgressBar();
  }

  @override
  void dispose() {
    super.dispose();
    progressBar.hide();
  }

  void showSendingProgressBar() {
    progressBar.show(context);
  }

  void hideSendingProgressBar() {
    progressBar.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              style: GoogleFonts.lato(color: Colors.black, fontSize: 15),
              controller: textCtrl,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.lato(color: Colors.grey, fontSize: 15),
                hintText: 'Identity',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 25,
                  color: Colors.blue[900]
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15)
              )
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: countCtrl,
              keyboardType: TextInputType.number,
              style: GoogleFonts.lato(color: Colors.black, fontSize: 15),
              decoration: InputDecoration(
                hintStyle: GoogleFonts.lato(color: Colors.grey, fontSize: 15),
                hintText: 'Jumlah Beli',
                prefixIcon: Icon(
                  Icons.confirmation_number_outlined,
                  size: 25,
                  color: Colors.blue[900]
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15)
              )
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: (){
                  showSendingProgressBar();
                  update();
                },
                label: Text('Simpan'),
                icon: Icon(Icons.save),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                )
              )
            ),
            SizedBox(height: 2),
            Container(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: (){
                  showSendingProgressBar();
                  delete();
                },
                label: Text('Hapus'),
                icon: Icon(Icons.delete_sweep_sharp),
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

  getContactDetail() async {
    DataSnapshot snapshot = await _ref.child(widget.contactKey).once();
    textCtrl.text = snapshot.value['text'];
    countCtrl.text = snapshot.value['count'].toString();
  }

  void update(){    
    _ref.child(widget.contactKey).update(
      {'text': textCtrl.text,'count':  int.parse(countCtrl.text),}).then((value) {
        hideSendingProgressBar();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            action: SnackBarAction(label: 'OK',onPressed: () {}),
            content: const Text('Success'),
            duration: const Duration(milliseconds: 100),
            behavior: SnackBarBehavior.floating
          )
      );
    });
  }

  void delete(){
    _ref.child(widget.contactKey).remove().then((value) {
      hideSendingProgressBar();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            action: SnackBarAction(label: 'OK',onPressed: () {}),
            content: const Text('Success'),
            duration: const Duration(milliseconds: 100),
            behavior: SnackBarBehavior.floating
          )
      );
    });
  }

}