// card_deck.dart
import 'dart:math';

class MemoryCard {
  //card id
  final int id;

  //path to image needing to be matched
  final String frontImagePath;

  //path to card cover image
  String backImagePath;

  //whether card is face up
  bool isFaceUp;

  //whether card has been matched
  bool isMatched;

  MemoryCard({
    required this.id,
    required this.frontImagePath,
    required this.backImagePath,
    this.isFaceUp = false,
    this.isMatched = false,
  });
}





class CardDeck {
  final List<MemoryCard> _cards;

  // Read-only view of the cards.
  List<MemoryCard> get cards => List.unmodifiable(_cards);

  // Builds a deck of 54 cards:
  //  - 27 unique front images
  //  - each front image appears exactly twice
  //  - all cards share the same back image
  CardDeck({
    required String backImagePath,
    required List<String> frontImagePaths,
  })  : assert(frontImagePaths.length == 27,
            'You must provide exactly 27 unique front image paths.'),
        _cards = [] {
    int idCounter = 0;

    // Create 2 cards for each front image
    for (final front in frontImagePaths) {
      _cards.add(
        MemoryCard(
          id: idCounter++,
          frontImagePath: front,
          backImagePath: backImagePath,
        ),
      );
      _cards.add(
        MemoryCard(
          id: idCounter++,
          frontImagePath: front,
          backImagePath: backImagePath,
        ),
      );
    }

    shuffle(); // initial shuffle
  }

  /// Randomly shuffles the deck in place.
  void shuffle() {
    _cards.shuffle(Random());
  }

  /// Resets state (face down & unmatched), then shuffles again.
  void reset() {
    for (final card in _cards) {
      card.isFaceUp = false;
      card.isMatched = false;
    }
    shuffle();
  }

  /// Optional helper: get a card by index (for grid use).
  MemoryCard operator [](int index) => _cards[index];

  int get length => _cards.length;
}
