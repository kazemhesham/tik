import 'package:flutter/material.dart';

import 'game_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0;
  String result = '';
  Game game = Game();

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SwitchListTile.adaptive(
                value: isSwitched,
                title: const Text(
                  'Turn on/off two palyer',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                onChanged: (newVal) => setState(() => isSwitched = newVal)),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "It's $activePlayer Turn",
              style: const TextStyle(color: Colors.white, fontSize: 29),
            ),
          ),
          Expanded(
              child: GridView.count(
            padding: const EdgeInsets.all(15),
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
            children: List.generate(
                9,
                (index) => InkWell(
                      onTap: gameOver ? null : () => _onTap(index),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSecondary,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                            child: Text(
                          Player.palyerX.contains(index)
                              ? 'X'
                              : Player.palyerO.contains(index)
                                  ? 'O'
                                  : '',
                          style: TextStyle(
                              color: Player.palyerX.contains(index)
                                  ? const Color.fromARGB(255, 0, 171, 48)
                                  : const Color.fromARGB(255, 218, 207, 1),
                              fontSize: 69),
                        )),
                      ),
                    )),
          )),
          Text(
            result,
            style: const TextStyle(color: Colors.white, fontSize: 39),
          ),
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  Player.palyerX = [];
                  Player.palyerO = [];
                  activePlayer = 'X';
                  gameOver = false;
                  turn = 0;
                  result = '';
                });
              },
              label: Text('Rebeat the Game',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
              icon: const Icon(Icons.repeat),
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ))
        ],
      )),
    );
  }

  _onTap(int num) async {
    if ((Player.palyerX.isEmpty || !Player.palyerX.contains(num)) &&
        (Player.palyerO.isEmpty || !Player.palyerO.contains(num))) {
      game.playgame(num, activePlayer);
      updeatState();
    }

    if (!isSwitched && !gameOver) {
      await game.autoPaly(activePlayer);
      updeatState();
    }
  }

  void updeatState() {
    return setState(() {
      turn++;
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      String winnername = game.checkWinner();
      if (winnername != '') {
        gameOver = true;
        result = 'Winner is $winnername';
      } else if (!gameOver && turn == 9) {
        result = 'it\'s faer';
      }
    });
  }
}
