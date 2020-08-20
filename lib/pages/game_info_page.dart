import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nma_games/models/game.dart';

class GameInfoPage extends StatelessWidget {
  const GameInfoPage({Key key, @required this.gameId})
      : assert(gameId != null, "Please pass a game id as an argument"),
        super(key: key);

  final String gameId;

  Widget _buildBody(BuildContext context, Game game) {
    return Text("${game.title}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection("games")
            .doc(gameId)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          return _buildBody(context, Game.fromDocumentData(snapshot.data));
        },
      )
      ,
    );
  }
}