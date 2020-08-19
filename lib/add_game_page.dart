import 'package:flutter/material.dart';

class AddGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Naujo žaidimo registracija"),
      ),
      body: Center(
        child: Column(
          children:[
            Image.asset("assets/placeholder.jpg"),
            Text(";labas")
          ]
        ),
      ),
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
