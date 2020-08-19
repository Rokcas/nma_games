import 'package:flutter/material.dart';
import 'package:nma_games/widgets/text_field_widget.dart';

class AddGamePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var pav = TextFieldWidget(value: "Pavadinimas");
    var apr = TextFieldWidget(value: "Aprašymas");
    var own = TextFieldWidget(value: "Aprašymas");
    return Scaffold(
      appBar: AppBar(
        title: Text("Naujo žaidimo registracija"),
      ),
      body: Column(
          children:
          [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(child: Image.asset("assets/placeholder.jpg")),
                  ),
                  Center(child: pav),
                  Center(child: apr)

                ],
              ),
            ),
            RaisedButton(
//              tooltip: "Registruoti",
              child: Text("Registruoti"),
              color:Colors.blueAccent,
              onPressed: (){
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the user has entered by using the
                      // TextEditingController.
                      content: Text(pav.getVal()),
                    );
                  },
                );
              },
            ),
          ]
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
