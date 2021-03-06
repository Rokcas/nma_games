import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  final String title;
  final String owner;
  final String description;
  final int minPlayers;
  final int maxPlayers;

  const Game(
    this.title,
    this.owner,
    this.description,
    this.minPlayers,
    this.maxPlayers,
  );

  factory Game.fromDocumentData(Map<String, dynamic> documentData){
    //TODO make sure necessary fields are int in the database to avoid parsing
    return Game(documentData["title"], documentData["owner"], documentData["description"], documentData["min_players"], documentData["max_players"]);
  }
}
