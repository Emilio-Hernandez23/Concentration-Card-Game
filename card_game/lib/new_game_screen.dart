import 'package:flutter/material.dart';
import 'card_deck.dart';
import 'card_images.dart';
import 'game_settings.dart';


class GameBoardScreen extends StatefulWidget {
  const GameBoardScreen({super.key});

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  late CardDeck _deck;
  late GameSettings _settings;

  int? _firstFlippedIndex; // index of the first flipped card in current attempt
  bool _canTap = true; // to prevent taps while waiting to flip back

  @override
  void initState() {
    super.initState();

    // If you’re using the "standard" factory:
    // _deck = CardDeck.standard(
    //   backImagePath: 'assets/images/cards/card_back.png',
    // );

    // Otherwise, manually provide the 27 front image paths:
    _deck = CardDeck(
      backImagePath: 'assets/images/Backgrounds/Backside1.png',
      // backImagePath: 'assets/images/Backgrounds/Home_Screen_Background.png',
      frontImagePaths: cardImagePaths,
    );

    _settings = GameSettings();
  }

    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = SettingsScope.of(context);
    if (!mounted) return;
    if (!_settings.hasListeners) {
      // remove old listener if present
      try {
       _settings.removeListener(_onSettingsChanged);
      } catch (_) {}
      _settings = settings;
      _settings.addListener(_onSettingsChanged);

      // apply current setting to all cards immediately
      for (final c in _deck.cards) {
        c.backImagePath = _settings.cardBackPath;
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    try {
      _settings.removeListener(_onSettingsChanged);
    } catch (_) {}
    super.dispose();
  }

  void _onSettingsChanged() {
    // when card back changes, update each card's backImagePath and refresh UI
    setState(() {
      for (final c in _deck.cards) {
        c.backImagePath = _settings.cardBackPath;
      }
    });
  }

  void _onCardTap(int index) {
    if (!_canTap) return;

    final card = _deck[index];

    // Ignore taps on already face-up or matched cards
    if (card.isFaceUp || card.isMatched) return;

    setState(() {
      card.isFaceUp = true;
    });

    // If this is the first card of the pair
    if (_firstFlippedIndex == null) {
      _firstFlippedIndex = index;
      return;
    }

    // Second card of the pair
    final firstIndex = _firstFlippedIndex!;
    final firstCard = _deck[firstIndex];

    // Don’t allow the same card to be picked twice
    if (firstIndex == index) {
      return;
    }

    // Check for a match (we can compare by frontImagePath)
    final isMatch = firstCard.frontImagePath == card.frontImagePath;

    if (isMatch) {
      // Mark both as matched
      setState(() {
        firstCard.isMatched = true;
        card.isMatched = true;
        // keep them face up
      });
      _firstFlippedIndex = null;
    } else {
      // Not a match: show for a bit, then flip both back
      _canTap = false;
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          firstCard.isFaceUp = false;
          card.isFaceUp = false;
          _firstFlippedIndex = null;
          _canTap = true;
        });
      });
    }
  }

  void _newGame() {
    setState(() {
      _deck.reset();
      _firstFlippedIndex = null;
      _canTap = true;
    });
  }

  int get _remainingPairs {
    return _deck.cards.where((card) => !card.isMatched).length ~/ 2;
  }

  @override
  Widget build(BuildContext context) {
    // For 54 cards, 6 columns gives 9 rows (6 x 9 = 54)
    const int crossAxisCount = 6;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards of Descruction - 1 Player'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _newGame,
          ),

        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          // ElevatedButton(
          //   onPressed: _newGame,
          //   child: const Text('New Game'),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(child: Center(
                  child: Text('Matches Remaining: $_remainingPairs',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  
                  ),
                  ),
                )
                ),
                ElevatedButton(onPressed: _newGame, child: const Text('New Game', style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'DragonHunter', color: Colors.white),)),
              
              ]
            ),
            
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.7,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: _deck.length,
              itemBuilder: (context, index) {
                final card = _deck[index];
                return _buildCard(card, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(MemoryCard card, int index) {
    final isFaceUp = card.isFaceUp || card.isMatched;

    return GestureDetector(
      onTap: () => _onCardTap(index),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 450),
        transitionBuilder: (child, animation) {
          // simple fade for now; you can change to rotation if you want fancy flip
          return FadeTransition(opacity: animation, child: child);
        },
        child: Container(
          key: ValueKey<bool>(isFaceUp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: card.isMatched ? Colors.green : Colors.black54,
              width: card.isMatched ? 3 : 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: isFaceUp
                ? Image.asset(
                    card.frontImagePath,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    card.backImagePath,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
