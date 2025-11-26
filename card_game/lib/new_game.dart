import 'package:card_game/main.dart';
import 'package:card_game/new_game_screen.dart';
import 'package:flutter/material.dart';

class NewGameScreen extends StatelessWidget {
  const NewGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Matching Mayhem")),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 2000,
              height: 800,
              child: Image.asset(
                'assets/images/Backgrounds/Home_Screen_Background.png',
                //check if yall like it
                //'images/Backgrounds/Menu2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  MaterialPageRoute(builder: (context) => const GameBoardScreen()),
                );
              },
              child: const Text("1 Player"),
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
              onPressed: null,
              child: const Text("2 Players"),
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
                  MaterialPageRoute(builder: (context) => const MenuScreen()),
                );
              },
              child: const Text("Back to Main Menu"),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}