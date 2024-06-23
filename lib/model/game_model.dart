enum Cards{flutterCard, unturendCard, emptyCard,}
enum GameState{init, playing, over}

class GameModel{
  int balance = 15;
  int card1 = 0;
  int card2 = 0;
  int card3 = 0;
  GameState state = GameState.init;
  late final List<Cards> board;

  GameModel(){
    board = [
      for(int i = 0; i < 3; i++) Cards.unturendCard,
    ];
  }

  void restart(){
    balance = 15;
    card1 = 0;
    card2 = 0;
    card3 = 0;
    for(int i = 0; i < 3; i++){
      board[i] = Cards.unturendCard;
    }

  }
}
