import 'package:flutter/material.dart';

class NewGameScreen extends StatelessWidget {
  const NewGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Matching Mayhem")),
      body: Column(
        children: [
          ElevatedButton(onPressed: null, child: Text("1 Player")),
          ElevatedButton(onPressed: null, child: Text("2 Players")),
        ],
      ),
    );
  }
}
