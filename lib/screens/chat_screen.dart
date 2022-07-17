// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:chat_ui/models/user_model.dart';
import 'package:chat_ui/models/message_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, isMe) {
    //MESSAGES CONTAINER
    final Container mssg = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6.0),
          Text(
            message.text,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: isMe ? Theme.of(context).accentColor : Color.fromARGB(255, 195, 219, 188),
          borderRadius: isMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0))
              : BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                )),
      // ignore: deprecated_member_use
    );

    if (isMe) {
      return mssg;
    }
    return Row(
      children: [
        mssg,
        IconButton(
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          iconSize: 20.0,
          color: message.isLiked
              ? Colors.red
              : Colors.blueGrey,
          onPressed: () {},
        ),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(children: [
        IconButton(
          icon: Icon(Icons.photo),
          iconSize: 25.0,
          color: Theme.of(context).primaryColor,
          onPressed: () {},
        ),
        Expanded(
          child: TextField(
          textCapitalization: TextCapitalization.sentences,
          onChanged: (value){},
          decoration: InputDecoration.collapsed(hintText: 'Type a message...'),
        )),
        IconButton(
          icon: Icon(Icons.send),
          iconSize: 25.0,
          color: Theme.of(context).primaryColor,
          onPressed: () {},
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.user.name,
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
