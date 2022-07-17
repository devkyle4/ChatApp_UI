import 'package:flutter/material.dart';
import 'package:chat_ui/models/message_model.dart';

import '../screens/chat_screen.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Favorite Contacts',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0)),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                  ),
                  color: Colors.blueGrey,
                  iconSize: 30.0,
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                   onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatScreen(
                              user: favorites[index],
                            )
                            ))),
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(favorites[index].imageUrl),
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            favorites[index].name,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
