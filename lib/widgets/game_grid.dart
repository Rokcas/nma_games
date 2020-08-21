import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nma_games/models/game.dart';
import 'package:nma_games/routes.dart';

class GameGrid extends StatelessWidget {
  Widget _buildGridItem(BuildContext context, Game game) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, Routes.ROUTE_GAME_INFO, arguments: game),
            child: Stack(
              children: [
                Image.asset("assets/unspecified_game_photo.png"),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          game.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("games").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return GridView.count(
          crossAxisCount: 2,
          children: snapshot.data.docs.map((e) => _buildGridItem(context, Game.fromDocumentData(e.data()))).toList(),
        );
      },
    );
  }
}
