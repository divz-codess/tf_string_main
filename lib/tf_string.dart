library tf_string;

import 'constants.dart';

/// A Calculator.import './contants.dart';

class TfString {
  static String addEmoji(String text, emojiName) {
    if (emojiName == Emoji.smiley) return text + ' 😊';
    if (emojiName == Emoji.angry) return text + ' 😠';
    if (emojiName == Emoji.cool) return text + ' 😎';
    if (emojiName == Emoji.sad) return text + ' 😔';
    if (emojiName == Emoji.crying) return text + ' 🥲';
    return text;
  }

/* Get list of words, from string . This method is used by string extension */
  static List<String> getListOfWords(String text) {
    return text.split(' ').toList();
  }

  /* Method to add any string after any word */
  static String insertAfter(String text, String after, String toInsert) {
    var words = getListOfWords(text);
    List<String> newList = [];
    for (var word in words) {
      newList.add(word);
      if (word == after) newList.add(toInsert);
    }

    String res = "";
    newList.forEach((word) => res += word += " ");

    return res;
  }

/* Method used by extension to convert to upperCase */
  static String toUpperCase(String word) {
    return word.toUpperCase();
  }

/* Make first letter capital */
  static String makeFirstLetterCapital(String word) {
    String res = word[0].toString().toUpperCase() +
        word.toString().substring(1, word.length).toLowerCase();
    return res;
  }

/* Make First leeter to small case  */
  static String makeFirstLetterLower(String word) {
    String res = word[0].toString().toLowerCase() +
        word.toString().substring(1, word.length).toLowerCase();
    return res;
  }
}
