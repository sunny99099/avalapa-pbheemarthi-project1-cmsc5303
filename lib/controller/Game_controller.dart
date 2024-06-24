import 'package:avalapa_pbheemarthi_project1_cmsc530/View/home_Screen.dart';
import 'package:avalapa_pbheemarthi_project1_cmsc530/model/game_model.dart';

class GameController{
  HomeState state;   
  GameController(this.state);

  void onPressedNewGame(){
    state.callSetState((){
      
        state.model.start();
    });
  }

  void onPressedPlay(){
    state.callSetState((){
      if(state.model.board[0].card_bet > 0 || state.model.board[1].card_bet > 0 || state.model.board[2].card_bet > 0) {
        if(frozeen) {
          state.model.play();
        }
      }
    });
  }

  void onPressedDownArrow(int i){
    state.callSetState((){
      if(state.model.board[i].card_bet > 0 && frozeen) {
        state.model.board[i].card_bet--;
        state.model.balance++;
      }
    });
  }

  void onPressedUpArrow(int i){
    state.callSetState((){
      if(state.model.balance > 0 && frozeen) {
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