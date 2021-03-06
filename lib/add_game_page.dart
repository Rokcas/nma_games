import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nma_games/routes.dart';
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
    var pageScaffold = Scaffold(
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
      floatingActionButton: FloatingActionButton.extended(
//          floatingActionButtonLocation:FloatingActionButtonLocation.endDocked,
        onPressed: () => sendNewGame(pav.getVal(), apr.getVal(), own.getVal(),
            mnP.getVal(), mxP.getVal(), context),
        label: Text("Siųsti"),
        icon: Icon(Icons.send),
        backgroundColor: Colors.blueAccent,
//          icon: Icons.send,
//        ),
      ),
    );
    return pageScaffold;
  }

  bool isNumeric(String s) {
    if (s == null) return false;
    return int.parse(s, onError: (e) => null) != null;
  }

  String dataStatusFinder(pav, apr, owner, minPlayers, maxPlayers) {
    if (owner == "") return "Nepažymėtas savininkas";
    if (apr == "") return "Nepažymėtas aprašymas";
    if (pav == "") return "Nepažymėtas pavadinimas";
    if (!isNumeric(minPlayers)) return "Blogas mažiausias žaidėjų skaičius";
    if (!isNumeric(maxPlayers)) return "Blogas didžiausias žaidėjų skaičius";
    if (int.parse(minPlayers) > int.parse(maxPlayers))
      return "Mažiausias žaidėjų skaičius yra per didelis";
    return "Sėkminga";
  }

  void alertMistake(s, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Klaida"),
          content: Text(s),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void sendNewGame(
      pav, apr, owner, minPlayers, maxPlayers, BuildContext context) {
    // String, String, String, int, int
    print(pav);
    String dataStatus =
        dataStatusFinder(pav, apr, owner, minPlayers, maxPlayers);
    if (dataStatus != "Sėkminga") {
      ///
      alertMistake(dataStatus, context);
    } else {
      FirebaseFirestore.instance.collection("games").add({
        "description": apr,
        "title": pav,
        "owner": owner,
        "max_players": maxPlayers,
        "min_players": minPlayers
      }).then(print);

      Navigator.pushNamed(
        context,
        Routes.ROUTE_MAIN,
      );
    }
  }
}
