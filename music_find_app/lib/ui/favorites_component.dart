import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  final Map<String, String> content;
  FavoriteItem({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(10),
        width: screenWidth,
        child: Center(
          child: Container(
            width: 320,
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      content["image"]!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${content["title"]}",
                            style: TextStyle(
                                color: Colors.grey[200],
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "${content["artist"]}",
                            style: TextStyle(color: Colors.grey[200]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
