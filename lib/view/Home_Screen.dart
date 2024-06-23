import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "/HomeScreen";

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Where is Flutter?"),
      ),
      body: bodyView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.fiber_new_rounded),
      ),
    );
  }

   Widget bodyView(BuildContext context) {
     return initScreen(context);
  /*  switch (model.state) {
      case GameState.init:
        return initScreen(context);
      case GameState.playing:
        return playingScreen(context);
      case GameState.over:
        return GameOverScreeen(context);
    }*/
  }

  Widget initScreen(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 164, 208, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to Find the Flutter Game",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "Press <new> for new game",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
