import 'package:avalapa_pbheemarthi_project1_cmsc530/controller/game_controller.dart';
import 'package:avalapa_pbheemarthi_project1_cmsc530/model/game_model.dart';
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
  late GameModel model;
  late GameController con;
  bool setSwitch = false;

  Map<Cards, Widget> images = {
    Cards.emptyCard: Image.asset("images/empty_card.jpg"),
    Cards.flutterCard: Image.asset("images/flutter_card.png"),
    Cards.unturendCard: Image.asset("images/Unturned.png"),
  };

  void callSetState(fn) => setState(fn);
  @override
  void initState() {
    super.initState();
    model = GameModel();
    con = GameController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Where is Flutter?"),
      ),
      body: bodyView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: con.onPressedNewGame,
        child: const Icon(Icons.fiber_new_rounded),
      ),
    );
  }

  Widget bodyView(BuildContext context) {
    switch (model.state) {
      case GameState.init:
        return initScreen(context);
      case GameState.playing:
        return playingScreen(context);
      case GameState.over:
        return GameOverScreeen(context, 1);
      case GameState.result:
        return playingScreen(context);
    }
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

  void cheat_display() {
    const Text("hello world");
  }

  Widget playingScreen(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("cheat key"),
            Switch(
                value: setSwitch,
                onChanged: (value) {
                  callSetState(() {
                    setSwitch = value;
                  });
                }),
          ],
        ),
        if (setSwitch) const Text("data"),
        const SizedBox(
          height: 20,
        ),
        Text("Balance: ${model.balance}"),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Row(
            children: [
              for (int i = 0; i < 3; i++) gamecard(context, i),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: con.onPressedPlay,
          child: const Text("play"),
        ),
      ],
    );
  }

  Widget gamecard(BuildContext context, int i) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.1,
            height: MediaQuery.of(context).size.width / 2,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                side: const BorderSide(width: 2.0, color: Colors.blue),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: images[model.board[i].card],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.lightBlue[200],
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    con.onPressedDownArrow(i);
                  },
                  icon: const Icon(Icons.arrow_downward),
                ),
                Text("${model.board[i].card_bet}"),
                IconButton(
                  onPressed: () {
                    con.onPressedUpArrow(i);
                  },
                  icon: const Icon(Icons.arrow_upward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget GameOverScreeen(BuildContext context, int i) {
    return Column(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,
            child: OutlinedButton(
              onPressed: () {},
              child: images[model.board[i].card],
            )),
      ],
    );
  }
}
