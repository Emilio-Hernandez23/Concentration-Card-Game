import 'package:flutter/widgets.dart';

//this class allows to notify other screens when a user changes the game settings (which is done in settings_screen.dart)
class GameSettings extends ChangeNotifier {
  String _cardBackPath = 'assets/images/Backgrounds/Home_Screen_Background.png';
  String get cardBackPath => _cardBackPath;

  set cardBackPath(String value) {
    if (_cardBackPath == value) return;
    _cardBackPath = value;
    notifyListeners();
  }
}

///the InheritedNotifier wrapper is used so widgets can access the same GameSettings instance
class SettingsScope extends InheritedNotifier<GameSettings> {
  const SettingsScope({
    super.key,
    required GameSettings notifier,
    required Widget child,
  }) : super(notifier: notifier, child: child);

  static GameSettings of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<SettingsScope>();
    assert(scope != null, 'SettingsScope not found in context');
    return scope!.notifier!;
  }
}