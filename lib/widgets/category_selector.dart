import 'package:flutter/material.dart';

class categorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<categorySelector> {
  @override
  final List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];
  int selectedIndex = 0;

  Widget build(BuildContext context) {
    return Container(
        height: 90.0,
        color: Theme.of(context).primaryColor,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = index;
                  });  
                },
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 30.0),
                child: Text(categories[index],
                    style: TextStyle(
                        color: index == selectedIndex ? Colors.white : Colors.white60,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2)),
              )
              );
            }));
  }
}