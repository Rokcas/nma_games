import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nma_games/widgets/text_field_widget.dart';

class AddGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var inputWidth = 300.0;
    var pav =
        TextFieldWidget(value: "Pavadinimas", size: inputWidth, maxLines: 1);
    var apr =
        TextFieldWidget(value: "Aprašymas", size: inputWidth, maxLines: 5);
    var own =
        TextFieldWidget(value: "Savininkas", size: inputWidth, maxLines: 1);
    var mnP = TextFieldWidget(
        value: "Min žaid.",
        size: inputWidth / 2 - 0.1 * inputWidth,
        maxLines: 1); // min players
    var mxP = TextFieldWidget(
        value: "Max žaid.",
        size: inputWidth / 2 - 0.1 * inputWidth,
        maxLines: 1); // max players
    const double myPadding = 16.0;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Registracija", style: TextStyle()),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background:
//                      Text("asdasd"),
                  Image.asset("assets/placeholder.jpg", fit: BoxFit.cover),
            ),
          ),
          SliverFillRemaining(
              hasScrollBody: true,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(myPadding),
                    child: pav,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(myPadding),
                    child: own,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(myPadding),
                    child: apr,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(myPadding),
                    child: Container(
                      child: Row(
                        children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: mxP,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: mnP,
                          ),
                        ),
                      ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
      floatingActionButton:
        FloatingActionButton.extended(
//          floatingActionButtonLocation:FloatingActionButtonLocation.endDocked,
          onPressed: () => sendNewGame(pav, apr, own, mnP, mxP),
          label: Text("Siųsti"),
          icon: Icon(Icons.send),
          backgroundColor: Colors.blueAccent,
//          icon: Icons.send,
//        ),
        ),
    );
  }
  String dataStatusFinder(pav, apr, owner, minPlayers, maxPlayers){

    return "-";
  }
  void sendNewGame(pav, apr, owner, minPlayers, maxPlayers){ // String, String, String, int, int
    print(pav.getVal());
    String dataStatus = dataStatusFinder(pav, apr, owner, minPlayers, maxPlayers);
    if(dataStatus != "Sėkminga"){


    }


  }
}
