import 'package:flutter/material.dart';
import 'package:nma_games/widgets/text_field_widget.dart';

class AddGamePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var inputWidth = 300.0;
    var pav = TextFieldWidget(value: "Pavadinimas", size: inputWidth);
    var apr = TextFieldWidget(value: "Aprašymas", size: inputWidth);
    var own = TextFieldWidget(value: "Savininkas", size: inputWidth);
    var mnP = TextFieldWidget(value: "Min žaid.", size: inputWidth/2 - 0.1*inputWidth); // min players
    var mxP = TextFieldWidget(value: "Max žaid.", size: inputWidth/2 - 0.1*inputWidth); // max players
    return Scaffold(
      appBar: AppBar(
        title: Text("Naujo žaidimo registracija"),
      ),
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                child: Image.asset("assets/placeholder.jpg")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 400,
              child: ListView.builder(
                // Let the ListView know how many items it needs to build.
                itemCount: 4,
                // Provide a builder function. This is where the magic happens.
                // Convert each item into a widget based on the type of item it is.
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: pav),
                    );
                  }else if(index == 1){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: apr),
                    );
                  }else if(index == 2){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: apr),
                    );
                  }else if(index == 3){
                    return Center(
                      child: Row(
                        children: [
                          mnP, mxP,
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    );
                  }
                  return Text("Klaida!!");
                },
              ),
            ),
          ),
        ],
      ),
    );

  }
}
