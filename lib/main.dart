import 'dart:math';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

import 'card-content.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anti Tinder',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red[900],
      ),
      home: const HomePage(),
      locale: const Locale.fromSubtags(languageCode: 'fr'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<String> testSwipes = ['Dorian', 'Etienne', 'Le Jack', 'Lina', 'Louna', 'Lou Rival'];
  late MatchEngine matchEngine;
  late List<SwipeItem> swipeItems;

  List<SwipeItem> getSwipeItems() => testSwipes
      .map((name) => SwipeItem(
            content: CardContent(
              name: name,
              age: 22,
              place: 'Paris',
              description: 'J\'aime Anne Hidalgo, et me battre',
              image: NetworkImage('https://picsum.photos/250?image=${Random().nextInt(10)}'),
            ),
          ))
      .toList();

  @override
  void initState() {
    swipeItems = getSwipeItems();
    matchEngine = MatchEngine(swipeItems: swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Anti Tinder'),
        ),
        body: Center(
          child: Column(children: [
            Expanded(
              child: SwipeCards(
                key: UniqueKey(),
                matchEngine: matchEngine,
                onStackFinished: () {},
                upSwipeAllowed: false,
                fillSpace: false,
                itemBuilder: (BuildContext context, int index) {
                  final CardContent item = swipeItems[index].content!;
                  return item.build(context);
                },
                itemChanged: (item, index) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Ink(
                    decoration: const ShapeDecoration(color: Colors.lightBlue, shape: CircleBorder()),
                    child: IconButton(
                      icon: const Icon(Icons.cancel),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  Ink(
                    decoration: const ShapeDecoration(color: Colors.lightBlue, shape: CircleBorder()),
                    child: IconButton(
                      icon: const Icon(Icons.android),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  Ink(
                    decoration: const ShapeDecoration(color: Colors.yellow, shape: CircleBorder()),
                    child: IconButton(
                      icon: const Icon(Icons.star),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profil'),
            BottomNavigationBarItem(icon: Icon(Icons.sports_kabaddi), label: 'Baggare'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
          ],
        ));
  }
}
