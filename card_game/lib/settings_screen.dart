import 'package:flutter/material.dart';
import 'package:card_game/game_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> _cardBackPaths = [
    'assets/images/Backgrounds/Backside1.png',
    'assets/images/Backgrounds/Home_Screen_Background.png',
    'assets/images/Backgrounds/dnd-abandoned-house.jpg',
    'assets/images/Backgrounds/dnd-workspace.jpg',
    
  ];
  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.of(context);
    final current = settings.cardBackPath;

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text('Choose card back', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: _cardBackPaths.map((path) {
                  return RadioListTile<String>(
                    value: path,
                    groupValue: current,
                    title: Text(path.split('/').last),
                    subtitle: SizedBox(
                      height: 80,
                      child: Image.asset(path, fit: BoxFit.contain),
                    ),
                    onChanged: (v) {
                      if (v != null) {
                        settings.cardBackPath = v;
                      }
                    },
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}