import 'package:flutter/material.dart';

import '../profile.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;

  const ProfilePage(this.profile, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(widget.profile.imgLink),
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
                Text('Nom: ${widget.profile.name}'),
                Text('Age: ${widget.profile.age}'),
                Text('Place: ${widget.profile.place}'),
                Text('Description: ${widget.profile.description}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              label: const Text('Éditer'),
              icon: const Icon(Icons.edit),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red[900]!),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              ),
              onPressed: () {},
            ),
          )
        ],
      );
}
