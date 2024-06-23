import 'package:avalapa_pbheemarthi_project1_cmsc530/View/home_Screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const TicTacTorApp());
}

class TicTacTorApp extends StatelessWidget{
  const TicTacTorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightBlue[300],

      ) ,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }

}