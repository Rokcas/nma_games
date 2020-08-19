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
            Container(child: Image.asset("assets/placeholder.jpg")),

          ]
        ),
      ),
    );
  }
}

class AboutPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(";abas");
    return Center(
      child: Text("TODO: Task 2132"),
    );
  }

}
