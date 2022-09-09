import 'package:flutter/material.dart';

import 'profile.dart';

class CardContent {
  Profile profile;
  NetworkImage image;

  CardContent(this.profile) : image = NetworkImage(profile.imgLink);

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
                  Text(profile.name + ', ' + profile.age.toString(), textAlign: TextAlign.left, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(profile.place, textAlign: TextAlign.left, style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                ],
              ),
              Text(profile.description, textAlign: TextAlign.left, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            ],
          ),
        )
      ]),
    );
  }
}
