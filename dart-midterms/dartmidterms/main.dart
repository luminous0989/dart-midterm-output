import 'dart:io';
import 'package:emojis/emojis.dart';
import "dart:math";

int win = 0;
int lose = 0;
int draw = 0;

String player() {
  print('Papel, Gunting, Bato! Whats your Pick? or quit');
  String ans = stdin.readLineSync().toUpperCase();

  switch (ans.toLowerCase()) {
    case "bato":
      return "Bato";
      break;
    case "papel":
      return "Papel";
      break;
    case "gunting":
      return "Gunting";
      break;
    default:
      return "Quit";
      break;
  }
}

//opponent
String opponent() {
  Random rand = new Random();
  int move = rand.nextInt(3);

  switch (move) {
    case 0:
      return "Bato";
      break;
    case 1:
      return "Papel";
      break;
    case 2:
      return "Gunting";
      break;
    default:
      break;
  }
}

//results
String rslts(String yourMove, String oppMove) {
  if (yourMove == oppMove) {
    draw++;
    return "Draw!";
  } else if (yourMove == "Bato!" && oppMove == "Gunting!") {
    win++;
    return "You Win!";
  } else if (yourMove == "Gunting!" && oppMove == "Papel!") {
    win++;
    return "You Win!";
  } else if (yourMove == "Papel!" && oppMove == "Bato!") {
    win++;
    return "You Win!";
  } else if (yourMove == "Gunting!" && oppMove == "Bato!") {
    lose++;
    return "Opponent Wins!";
  } else if (yourMove == "Papel!" && oppMove == "Gunting!") {
    lose++;
    return "Opponent Wins!";
  } else if (yourMove == "Bato!" && oppMove == "Papel!") {
    lose++;
    return "Opponent Wins!";
  } else {
    lose++;
    return "Opponent Wins!";
  }
}

String toEmoji(ans) {
  switch (ans) {
    case "Bato":
      return ('${Emojis.oncomingFist}');
      break;
    case "Papel":
      return ('${Emojis.raisedHand}');
      break;
    case "Gunting":
      return ('${Emojis.victoryHand}');
      break;
    default:
      return "Quit";
      break;
  }
}

void main() {
  while (true) {
    print("==============================");
    print('SCORE: Wins: $win Loss: $lose Draws: $draw');
    print("==========NEW GAME============");
    String yourMove = player();
    if (yourMove == "Quit") {
      return;
    }

    print('===============================');
    var yourMoveEmoji = toEmoji(yourMove);
    print("Pinili mo ang $yourMoveEmoji");
    String oppMove = opponent();

    var oppMoveEmoji = toEmoji(oppMove);
    print("Pinili ng kalaban ang $oppMoveEmoji");
    print(rslts(yourMove, oppMove));
  }
}
