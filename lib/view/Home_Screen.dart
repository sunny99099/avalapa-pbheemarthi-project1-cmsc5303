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
        return GameOverScreeen(context);
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
    Text("Flutter Postion is ${model.flutter_card_pos}");
  }

  Widget playingScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
          if (setSwitch)
            Text(
              "SECRET: (Flutter is at card ${model.flutter_card_pos})",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
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
            style: ButtonStyle(
              backgroundColor: con.On_off()
                  ? WidgetStateProperty.all<Color>(Colors.lightBlue[100]!)
                  : WidgetStateProperty.all<Color>(
                      Colors.lightBlue[50]!), // Set button background color
            ),
            child: const Text("play"),
          ),
          const SizedBox(
            height: 40,
          ),
          if (con.gain_result)
            Container(
                color: Colors.green[100],
                child: Text(
                  "You won: ${model.bet}(on Key) X 3 = ${model.gain} coin(s)\nPress <NEW> for another round",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
        ],
      ),
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
            width: MediaQuery.of(context).size.width / 3.2,
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
                  icon: Icon(
                    Icons.remove,
                    color: con.down_on(i) ? Colors.black : Colors.white,
                  ),
                ),
                Text("${model.board[i].card_bet}"),
                IconButton(
                  onPressed: () {
                    con.onPressedUpArrow(i);
                  },
                  icon: Icon(
                    Icons.add,
                    color: con.up_on() ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget GameOverScreeen(BuildContext context) {
    return Container(
      color: Colors.red[200],
      child: Column(
        children: [
          Text(
            "You are Broke",
            style: Theme.of(context).textTheme.headlineLarge,
          ),

          const SizedBox(height: 20,),
          Center(
            child: FilledButton(
              onPressed: con.onPressedPlayAgain,
              child: const Text("Play Again"),
            ),
          ),
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
          if (setSwitch) Text(
              "SECRET: (Flutter is at card ${model.flutter_card_pos})",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
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
      ),
    );
  }
}
