import 'package:flutter/material.dart';

class AddGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About NMAkademis"),
      ),
      body: Container(child: AboutPageBody()),
    );
  }
}

class AboutPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("TODO: Task 2132"),
    );
  }

}
