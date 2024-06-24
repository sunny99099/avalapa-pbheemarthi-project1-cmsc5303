import 'package:avalapa_pbheemarthi_project1_cmsc530/View/home_Screen.dart';

class GameController{
  HomeState state;
  GameController(this.state);

  void onPressedNewGame(){
    state.callSetState((){
      state.model.restart();
    });
  }

  void onPressedDownArrow(int i){
    state.callSetState((){
      state.model.board[i].card_bet--;
    });
  }

  void onPressedUpArrow(int i){
    state.callSetState((){
      state.model.board[i].card_bet++;
    });
  }

  void onPressedSwitch(){
    state.callSetState((){
      state.cheat_display();
    });
  }

}