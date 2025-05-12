import 'dart:math';

class Player {
  static const x = 'x';
  static const o = 'o';
  static const empty = '';
  static List<int> palyerX = [];
  static List<int> palyerO = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int z, int y) {
    return this.contains(x) && this.contains(z) && this.contains(y);
  }
}

class Game {
  void playgame(int num, String activePlayer) {
    if (activePlayer == 'X') {
      Player.palyerX.add(num);
    } else {
      Player.palyerO.add(num);
    }
  }

  checkWinner() {
    String winner = '';
    if (Player.palyerX.containsAll(0, 1, 2) ||
        Player.palyerX.containsAll(3, 4, 5) ||
        Player.palyerX.containsAll(6, 7, 8) ||
        Player.palyerX.containsAll(0, 3, 6) ||
        Player.palyerX.containsAll(1, 4, 7) ||
        Player.palyerX.containsAll(2, 5, 8) ||
        Player.palyerX.containsAll(0, 4, 8) ||
        Player.palyerX.containsAll(2, 4, 6)) {
      winner = 'X';
    }else if (Player.palyerO.containsAll(0, 1, 2) ||
        Player.palyerO.containsAll(3, 4, 5) ||
        Player.palyerO.containsAll(6, 7, 8) ||
        Player.palyerO.containsAll(0, 3, 6) ||
        Player.palyerO.containsAll(1, 4, 7) ||
        Player.palyerO.containsAll(2, 5, 8) ||
        Player.palyerO.containsAll(0, 4, 8) ||
        Player.palyerO.containsAll(2, 4, 6)) {
      winner = 'O';
    } else {
      winner = '';
    }

    return winner;
  }

  Future autoPaly(String activePlayer) async {
    int index = 0;
    List<int> emptyindex = [];

    for (var i = 0; i < 9; i++) {
      if (!(Player.palyerX.contains(i) || Player.palyerO.contains(i))) {
        emptyindex.add(i);
      }
    }
    Random random = Random();

    int randomIndex = random.nextInt(emptyindex.length);
    index = emptyindex[randomIndex];
    playgame(index, activePlayer);
  }
}
