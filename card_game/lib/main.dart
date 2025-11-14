import 'package:card_game/new_game.dart';
import 'package:flutter/material.dart';

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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            textStyle: const TextStyle(fontSize: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            )
          )
        )
        ),
      home: MenuScreen(),
      routes: {
        GamesScreen.routeName: (game) => const GamesScreen(),
      },
    );
  }
}

// Menu Screen
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
        centerTitle: true,
      ),
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
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('Start Game'),
                  onTap: () {
                    Navigator.of(context).pushNamed(GamesScreen.routeName);
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
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
                  onPressed: () {},
                  child: const Text("Leaderboard"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("How to Play"),
                ),
                ElevatedButton(
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

// Game Screen
class GamesScreen extends StatelessWidget {
  static const routeName = '/details';

  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: FilledButton(
          onPressed: () => Navigator.of(context).pop(), // go back to menu
          child: const Text('Back'),
        ),
      ),
    );
  }
}
