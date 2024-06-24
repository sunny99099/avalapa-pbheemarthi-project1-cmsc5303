import 'dart:math';

enum Cards{flutterCard, unturendCard, emptyCard,}
enum GameState{init, playing, over,result}

bool frozeen = false;

class boards{
  late int card_bet;
  late Cards card;
  boards({card_bet, card});
}

Random random = Random();
late int flutter_card_pos;

class GameModel{
  int balance = 15;

  GameState state = GameState.init;
  late final List<boards> board;

  GameModel(){
    board = List.generate(3, (index) => boards(card_bet: 0, card: Cards.unturendCard));
  }

  void start(){
    frozeen  = true;
    flutter_card_pos = random.nextInt(3);
    state = GameState.playing;
    for(int i = 0; i < 3; i++){
      board[i].card_bet = 0;
      board[i].card =Cards.unturendCard;
    }

  }

  void play(){
    frozeen = false;
    for(int i = 0 ; i < 3; i++){
      board[i].card_bet = 0;
      board[i].card =Cards.emptyCard;
    }
    board[flutter_card_pos].card = Cards.flutterCard;
    state = GameState.result;
  }
}
