import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About NMA"),
      ),
      body: Container(child: AboutPageBody()),
    );
  }
}

class AboutPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Task 2
    return Center(
      child: Text("TODO: Task 2"),
    );
  }

}
