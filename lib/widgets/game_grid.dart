import 'package:flutter/material.dart';

class GameGrid extends StatelessWidget {
  Widget _buildGridItem(String title) {
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
                          'Item $index',
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
    return GridView.count(
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: [_buildGridItem(title)]);
  }
}
