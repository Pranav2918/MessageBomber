import 'package:flutter/cupertino.dart';

class MessageBombProvider extends ChangeNotifier {
  List<String> bombedMessage = [];
  bool needNumber = false;
  String shareText = "";

  //Explode message method
  void explodeMessage(
      TextEditingController count, TextEditingController message) {
    bombedMessage.clear();
    if (message.text.isNotEmpty && count.text.isNotEmpty) {
      for (int i = 0; i < int.parse(count.text); i++) {
        bombedMessage.add(message.text);
        notifyListeners();
      }
    }
  }

  //Check for numbers
  void checkNumber(bool value) {
    needNumber = value;
    notifyListeners();
  }

  //Method to handle string
  void manageString(List<String> words) {
    if (needNumber) {
      shareText = words
          .asMap()
          .map((index, word) => MapEntry(index + 1, '${index + 1}. $word'))
          .values
          .join("\n");
      notifyListeners();
    } else {
      shareText = words
          .asMap()
          .map((index, word) => MapEntry(index + 1, word))
          .values
          .join("\n");
      notifyListeners();
    }
  }
}
