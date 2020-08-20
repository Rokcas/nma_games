import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  final String id;
  final String title;
  final String owner;
  final String description;
  final int minPlayers;
  final int maxPlayers;

  const Game(
    this.id,
    this.title,
    this.owner,
    this.description,
    this.minPlayers,
    this.maxPlayers,
  );

  factory Game.fromDocumentData(DocumentSnapshot snapshot){
    final documentData = snapshot.data();
    //TODO make sure necessary fields are int in the database to avoid parsing
    return Game(snapshot.id, documentData["title"], documentData["owner"], documentData["description"], int.parse(documentData["min_players"]), int.parse(documentData["max_players"]));
  }
}
