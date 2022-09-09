import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../action-button.dart';
import '../card-content.dart';
import '../events.dart';
import '../main.dart' show eventBus;
import '../profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Profile> testSwipes = [
    Profile(id: 1, name: 'Dorian', age: 22, description: 'J\'aime Anne Hidalgo, et me battre', place: 'Paris', imgLink: 'https://placebeard.it/250x250'),
    Profile(id: 2, name: 'Etienne', age: 22, description: 'J\'aime Lina, et me battre', place: 'Angers', imgLink: 'https://placebeard.it/250x250'),
    Profile(id: 3, name: 'Bruno Goyet', age: 50, description: 'Venez à mes CM de math infos vous aurez envie de me liker', place: 'ENSAM Angers', imgLink: 'https://placebeard.it/250x250'),
    Profile(id: 4, name: 'Lina', age: 22, description: 'J\'aime Etienne, et me battre', place: 'Paris', imgLink: 'https://placebeard.it/250x250'),
    Profile(id: 5, name: 'Louna', age: 22, description: 'Envie de me bastonner', place: 'Paris', imgLink: 'https://placebeard.it/250x250'),
  ];
  late MatchEngine matchEngine;
  late List<SwipeItem> swipeItems;

  List<SwipeItem> getSwipeItems() => testSwipes
      .map((profile) => SwipeItem(
            content: CardContent(profile),
            onSlideUpdate: (region) async {
              switch (region) {
                case SlideRegion.inLikeRegion:
                  eventBus.fire(ActionButtonFocusedEvent(ButtonType.Like));
                  break;
                case SlideRegion.inNopeRegion:
                  eventBus.fire(ActionButtonFocusedEvent(ButtonType.Nope));
                  break;
                default:
                  eventBus.fire(ActionButtonFocusedEvent(ButtonType.None));
                  break;
              }
            },
            likeAction: () {
              final bool isReciprocal = Random().nextBool();
              if (isReciprocal) {}
            },
            nopeAction: () {},
          ))
      .toList();

  @override
  void initState() {
    testSwipes.shuffle();
    swipeItems = getSwipeItems();
    matchEngine = MatchEngine(swipeItems: swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Column(children: [
          Expanded(
            child: SwipeCards(
              key: UniqueKey(),
              matchEngine: matchEngine,
              onStackFinished: () {},
              upSwipeAllowed: false,
              fillSpace: false,
              itemChanged: (item, index) {
                eventBus.fire(ActionButtonFocusedEvent(ButtonType.None));
              },
              itemBuilder: (BuildContext context, int index) {
                final CardContent item = swipeItems[index].content!;
                return item.build(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(ButtonType.Nope, Icons.close, Colors.red[900]!, matchEngine.currentItem?.nope),
                ActionButton(ButtonType.Info, Icons.info, Colors.blue, () {}),
                ActionButton(ButtonType.Like, Icons.wheelchair_pickup, Colors.yellow[800]!, matchEngine.currentItem?.like),
              ],
            ),
          ),
        ]),
      );
}
