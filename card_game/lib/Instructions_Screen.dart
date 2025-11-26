//import 'package:card_game/main.dart';
import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget{
  const InstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Game Instructions:"),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How to play',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Tap two cards to flip them.\n'
                      '• If they match they stay face up.\n'
                      '• If they do not match they flip back.\n'
                      '• Every matched pair will earn +10 points.\n'
                      '• Try to match all pairs with as few moves as possible.\n'
                      '• The player with the most points at the end of the game will be declared the winner!\n',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Tips',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Remember positions and take your time to memorize cards.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(fontSize: 20, fontFamily: 'DragonHunter'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text('Back'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}