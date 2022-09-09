import 'package:anti_tinder_2/profile.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

import 'routes/chat-page.dart';
import 'routes/home-page.dart';
import 'routes/profile-page.dart';

EventBus eventBus = EventBus();

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anti Tinder',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red[900],
      ),
      routes: {
        '/': (context) => const BasePage(),
      },
      initialRoute: '/',
      locale: const Locale.fromSubtags(languageCode: 'fr'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => BasePageState();
}

class BasePageState extends State<BasePage> {
  final Color mainColor = Colors.red[900]!;
  final Map<int, Widget> pageMap = {
    0: ProfilePage(Profile(id: 1, name: 'Dorian', age: 22, description: 'J\'aime Anne Hidalgo, et me battre', place: 'Paris', imgLink: 'https://placebeard.it/250x250')),
    1: const HomePage(),
    2: const ChatPage(),
  };
  int currentItemIndex = 1;

  Widget? buildBody() => pageMap[currentItemIndex];

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Anti Tinder'),
            backgroundColor: mainColor,
          ),
          body: buildBody(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentItemIndex,
            selectedItemColor: mainColor,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profil'),
              BottomNavigationBarItem(icon: Icon(Icons.sports_kabaddi), label: 'Baggare'),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
            ],
            onTap: (index) {
              setState(() => currentItemIndex = index);
            },
          ),
        ),
      );
}
