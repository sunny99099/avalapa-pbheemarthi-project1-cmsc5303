import 'package:avalapa_pbheemarthi_project1_cmsc530/View/home_Screen.dart';

class GameController{
  HomeState state;   
  GameController(this.state);
  bool gain_result = false;

  void onPressedNewGame(){
    state.callSetState((){
        gain_result = false;
        state.model.start();
    });
  }

  bool On_off(){
    return state.model.board[0].card_bet > 0 || state.model.board[1].card_bet > 0 || state.model.board[2].card_bet > 0;
  }

  void onPressedPlay(){
    state.callSetState((){
      if(On_off()) {
        if(state.model.frozeen) {
          gain_result = true;
          state.model.play();
        }
      }
    });
  }
  bool down_on(int i){
    return state.model.board[i].card_bet > 0 && state.model.frozeen;
  }
  void onPressedDownArrow(int i){
    state.callSetState((){
      if(down_on(i)) {
        state.model.board[i].card_bet--;
        state.model.balance++;
      }
    });
  }
  bool up_on(){
    return state.model.balance > 0 && state.model.frozeen;
  }
  void onPressedUpArrow(int i){
    state.callSetState((){
      if(up_on()) {
        state.model.board[i].card_bet++;
        state.model.balance--;
      }
    });
  }

  void onPressedSwitch(){
    state.callSetState((){
      state.cheat_display();
    });
  }

  void onPressedPlayAgain(){
    state.callSetState((){
      state.model.Again();
    });
  }

}