import 'package:flutter/material.dart';

class CardContent {
  final String name;
  final int age;
  final String place;
  final String description;
  final NetworkImage image;

  CardContent({
    required this.name,
    required this.age,
    required this.place,
    required this.description,
    required this.image,
  });

  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name + ', ' + age.toString(), textAlign: TextAlign.left, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(place, textAlign: TextAlign.left, style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                ],
              ),
              Text(description, textAlign: TextAlign.left, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            ],
          ),
        )
      ]),
    );
  }
}
