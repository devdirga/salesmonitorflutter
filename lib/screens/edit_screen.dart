import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/custom_color.dart';
import 'package:flutter_application_1/utils/database.dart';
import 'package:flutter_application_1/widgets/app_bar_title.dart';

class EditScreen extends StatefulWidget{
  final String current_text;
  final String current_date;
  final String current_count;
  final String documentId;

  EditScreen({
    required this.current_text,
    required this.current_date,
    required this.current_count,
    required this.documentId,
  });
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _textFocusNode = FocusNode();
  final FocusNode _countFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();
  bool _isDeleting = false;

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _textFocusNode.unfocus();
        _countFocusNode.unfocus();
        _dateFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
           title: AppBarTitle(),
           actions: [
             _isDeleting
              ? Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    right: 16.0
                  ),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.redAccent,
                    ),
                    strokeWidth: 3,
                  ),
                )
                : IconButton(
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });
                      // await Database.updateItem(key: key, count: count, date: date, text: text)
                    } , 
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    )
                  )
           ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
  
}