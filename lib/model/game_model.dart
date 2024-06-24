enum Cards{flutterCard, unturendCard, emptyCard,}
enum GameState{init, playing, over}

class boards{
  late int card_bet;
  late Cards card;
  boards({card_bet, card});
}

class GameModel{
  int balance = 15;

  GameState state = GameState.init;
  late final List<boards> board;

  GameModel(){
    board = List.generate(3, (index) => boards(card_bet: 0, card: Cards.unturendCard));
  }

  void restart(){
    balance = 15;
    state = GameState.playing;
    for(int i = 0; i < 3; i++){
      board[i].card_bet = 0;
      board[i].card =Cards.unturendCard;
    }

  }
}
