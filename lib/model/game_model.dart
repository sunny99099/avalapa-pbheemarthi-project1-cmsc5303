import 'dart:math';

enum Cards{flutterCard, unturendCard, emptyCard,}
enum GameState{init, playing, over, result}



class boards{
  late int card_bet;
  late Cards card;
  boards({card_bet, card});
}

Random random = Random();

class GameModel{
  int balance = 15;
  bool frozeen = false;
  GameState state = GameState.init;
  late final List<boards> board;
  late int flutter_card_pos;
  int bet = 0;
  int gain =0;
  bool pause = true;

  GameModel(){
    board = List.generate(3, (index) => boards(card_bet: 0, card: Cards.unturendCard));
    for(int i = 0; i < 3; i++){
      board[i].card_bet = 0;
      board[i].card =Cards.unturendCard;
    }
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
    if(board[flutter_card_pos].card_bet > 0 ) {
      bet = board[flutter_card_pos].card_bet;
      gain = bet*3;
      balance = balance + gain;
    }
    for(int i = 0 ; i < 3; i++){
      board[i].card_bet = 0;
      board[i].card =Cards.emptyCard;
    }
    board[flutter_card_pos].card = Cards.flutterCard;
    if(balance > 0) {
      state = GameState.result;
    }
    else{
      pause = false;
      state = GameState.over;
    }
  }

  void Again(){
    start();
    balance = 15;
  }
}
