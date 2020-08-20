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
  final double size;
  TextFieldWidget({Key key, @required this.value, @required this.size});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState(value:value, myController:myController, size:size);

  String getVal(){
    print(myController.text);
    return myController.text;
  }
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String value;
  double size = 200.0;
  final myController;
  _TextFieldWidgetState({Key key, @required this.value, @required this.myController, @required this.size});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Container(
          width: size,
          child: TextField(
            decoration: InputDecoration(hintText: value),
            textAlign: TextAlign.center,
            controller: myController,
//          selectionWidthStyle: BoxWidthStyle.max,
          ),
        ),

      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
