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

  final String value;
  final int maxLines;
  final double size;

  TextFieldWidget(
      {Key key, @required this.value, @required this.size, this.maxLines});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState(
      value: value, myController: myController, size: size, maxLines: maxLines);

  String getVal() {
    print(myController.text);
    return myController.text;
  }
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String value;
  double size = 200.0;
  final myController;
  int maxLines = 1;

  _TextFieldWidgetState(
      {Key key,
      @required this.value,
      @required this.myController,
      @required this.size,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: value,
//              focusedBorder: OutlineInputBorder(
//                borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
//              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
        textAlign: TextAlign.left,
        controller: myController,
//          selectionWidthStyle: BoxWidthStyle.max,
      ),
    );
  }
}
