import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GameGrid extends StatelessWidget {
  Widget _buildGridItem(Map<String, dynamic> data) {
    assert(data['title'] != null);
    // TODO add more assertions


    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: () => print("TODO"),
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
                          "${data["title"]}",
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
          children: snapshot.data.docs.map((e) => _buildGridItem(e.data())).toList(),
        );
      },
    );
  }
}
