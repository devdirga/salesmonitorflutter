import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/edit_contact.dart';
import 'package:flutter_application_1/utils/NoAnimationMaterialPageRoute.dart';
import 'package:flutter_application_1/utils/ProgressBar.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class MessageWidget extends StatelessWidget {
  final String keyuid;
  final String message;
  final int count;
  final DateTime date;
  MessageWidget(this.keyuid, this.message, this.count, this.date);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.food_bank_outlined),
      title: Text("Identitas : $message"),
      subtitle: Text("Chicken    : $count"),
      onTap: () {
        Navigator.push(
          context, NoAnimationMaterialPageRoute(
          builder: (_)=> EditContact(contactKey: keyuid))
        );
      }
    );
  }
}



/*

Card(
      child: Container(        
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                    Navigator.push(
                      context, NoAnimationMaterialPageRoute(
                      builder: (_)=> EditContact(contactKey: keyuid))
                    );
                },
                child: Column(
                  children: [
                    Row(
                      children:[
                        Text(
                          "Identitas : $message" ,
                          style: GoogleFonts.lato(color: Colors.blueGrey[600], fontSize: 16),
                          textAlign: TextAlign.left                     
                        ),
                        SizedBox(height: 20)
                      ]
                    ),
                    Row(
                      children: [
                        Text(
                          "Jumlah      : $count",
                          style: GoogleFonts.lato(color: Colors.blueGrey[600], fontSize: 16),
                          textAlign: TextAlign.right
                        )            
                      ]
                    ),
                    // Row(
                    //   children: [
                    //     ElevatedButton.icon(
                    //       onPressed: (){
                    //         Navigator.push(
                    //           context, NoAnimationMaterialPageRoute(
                    //           builder: (_)=> EditContact(contactKey: keyuid))
                    //         );
                    //     },
                    //     label: Text('Edit'),
                    //     icon: Icon(Icons.edit_attributes_outlined),
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Colors.black,
                    //     ),                          
                    //     ),
                    //   ],
                    // )
                  ]
                )
              )
            ]
          )
        )
      )
    );

*/