import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nma_games/models/game.dart';

class GameInfoPage extends StatelessWidget {
  const GameInfoPage({Key key, @required this.game})
      : assert(game != null, "Please pass a game as an argument"),
        super(key: key);

  final Game game;

  Widget _buildBody(BuildContext context, Game game) {
    return ListView(
      children: [
        Container(
          height: 200,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset("assets/unspecified_game_photo.png"),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  game.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
//                    color: Colors.white,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  game.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child:
              Text("Žaidėjų skaičius: ${game.minPlayers}-${game.maxPlayers}"),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text("Savininkas: ${game.owner}"),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "Aprašymas",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(game.description),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context, game),
    );
  }
}
