import 'dart:ui';

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {

  final myController = TextEditingController();

//  @override
//  void dispose() {
//     Clean up the controller when the widget is disposed.
//    myController.dispose();
//    super.dispose();
//  }


  final String value ;
  TextFieldWidget({Key key, this.value});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState(value:value, myController:myController);

  String getVal(){
    print("esu cia");
    print(myController.text);
    return myController.text;
  }
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String value;
  final myController;
  _TextFieldWidgetState({Key key, this.value, this.myController});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Container(
          width: 200,
          child: TextField(
            decoration: InputDecoration(hintText: value),
            controller: myController,
//          selectionWidthStyle: BoxWidthStyle.max,
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(myController.text),
                );
              },
            );
          },
          tooltip: 'Show me the value!',
          child: Icon(Icons.text_fields),
        )

      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
