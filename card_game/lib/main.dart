import 'package:card_game/Instructions_Screen.dart';
import 'package:card_game/new_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


//import 'package:flutter/cupertino.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cards of Destruction',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: Colors.blue,
        fontFamily: 'DragonHunter',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            textStyle: const TextStyle(fontSize: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            )
          )
        ),
        brightness: Brightness.dark
        ),
      home: MenuScreen(),
    );
  }
}

// Menu Screen
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Main Menu'),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          
          // Background image
          Positioned.fill(
            //choose between these 2 backgrounds
            child: Image.asset(
              'assets/images/Backgrounds/Home_Screen_Background.png',
            // child: Image.asset(
            //   'assets/images/Backgrounds/Home_Screen_Background2.png',
              fit: BoxFit.cover,
            ),
          ),
          

          // Foreground content (buttons)
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "Cards of Destruction",
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2.0
                          ..color = Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Cards of Destruction",
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 165, 26, 8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 20, fontFamily: 'DragonHunter'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewGameScreen(),
                      ),
                    );
                  },
                  child: const Text("New Game"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 20, fontFamily: 'DragonHunter'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Leaderboard"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 20, fontFamily: 'DragonHunter'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InstructionsScreen(),
                      ),
                    );
                  },
                  child: const Text("How to Play"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 20, fontFamily: 'DragonHunter'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Settings"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}