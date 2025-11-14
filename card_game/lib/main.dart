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
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
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
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Start Game'),
            onTap: () {
              Navigator.of(context).pushNamed(GamesScreen.routeName);
            },
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewGameScreen()),
            );
          }, child: Text("New Game"))
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
