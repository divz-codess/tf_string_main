
import './tf_string.dart';
import 'constants.dart';
import 'utility/bad_word_util.dart';
import 'utility/emoji_util.dart';

/*------------------------------------------------------------------------------
An extension for dart's string class to provide easy usability 
of extended methods on strings 

------------------------------------------------------------------------------ */
extension tfStringExtension on String {
/*------------------------------------------------------------------------------
  Add smiley to text, using emoji map to get the emoji
------------------------------------------------------------------------------ */

  String addSmiley() {
    return TfString.addEmoji(this, Emoji.smiley);
  }

  String toEmojiString() {
    String emojiName = "";
    String result = "";
    List wordList = this.split(':');
    print(wordList);
    if (wordList.length > 1) {
      emojiName = wordList[1];
      result = wordList[0] + " " + EmojiUtils.getEmoji(emojiName);
    }
    return result;
  }
/*------------------------------------------------------------------------------
  Change case of string to upperCase using ("example".toUpperCase())
------------------------------------------------------------------------------ */

  String toUppercase() {
    return TfString.toUpperCase(this);
  }
/*------------------------------------------------------------------------------
Get list of word in the string  : Usage ("this is example".toWordList) => ["this","is","example"]
------------------------------------------------------------------------------ */

  List<String> toWordList() {
    return TfString.getListOfWords(this);
  }

/*----------------------------------------------------------------------------------------------------------
  Change the case of string to capitalCase: Usage ("example string".toCapitalCase() => Example String
---------------------------------------------------------------------------------------------------------- */

  String toCapitalCase() {
    var wordList = TfString.getListOfWords(trim());
    String result = "";
    wordList.forEach((word) {
      result += word[0].toString().toUpperCase() +
          word.toString().substring(1, word.length).toLowerCase() +
          " ";
    });
    return result;
  }

/*----------------------------------------------------------------------------------------------------------
  Convert string to lowerCase : Usage("This STring".toLowerCase) => this string
---------------------------------------------------------------------------------------------------------- */
  String toLowerCase() {
    return toString().toLowerCase();
  }

/*----------------------------------------------------------------------------------------------------------
  Convert string to camelcase : Usage(" This Is String".toCamelCase()) => thisIsString
---------------------------------------------------------------------------------------------------------- */
  String toCamelCase() {
    TfString tfString = TfString();
    var wordList = TfString.getListOfWords(trim());
    String result = "";
    result += wordList[0].toLowerCase();
    for (var index = 1; index < wordList.length; index++) {
      result += TfString.makeFirstLetterCapital(wordList[index]);
    }
    return result;
  }

/*----------------------------------------------------------------------------------------------------------
  Count number of letters in the stirng and return the count 
  Usage: ("Get Letters".countLetters() =>  10 excludes space)
---------------------------------------------------------------------------------------------------------- */
  int countLetters() {
    int letters = 0;
    int n = length;
    for (int i = 0; i < n; i++) {
      if (this[i] != ' ') letters += 1;
    }
    return letters;
  }

/*----------------------------------------------------------------------------------------------------------
  Get letter set in the string
  Usage: ("this is sample".letterSet() => {""}) 
---------------------------------------------------------------------------------------------------------- */
  Set letterSet() {
    int n = length;
    Set<String> letterSet = {};
    for (int i = 0; i < n; i++) {
      if (this[i] != ' ') letterSet.add(this[i]);
    }
    return letterSet;
  }

/*----------------------------------------------------------------------------------------------------------
  Checks if the string contains given word or not
  It returns boolean 
---------------------------------------------------------------------------------------------------------- */

  bool hasWord(String word) {
    var wordList = TfString.getListOfWords(trim());
    if (wordList.contains(word)) return true;
    return false;
  }

/*----------------------------------------------------------------------------------------------------------
  Removes all possible space from string
---------------------------------------------------------------------------------------------------------- */
  String removeSpace() {
    var wordList = TfString.getListOfWords(trim());

    String withoutSpace = "";
    for (String word in wordList) {
      withoutSpace += word;
    }

    return withoutSpace;
  }

/*----------------------------------------------------------------------------------------------------------
  Counts number of word in the string, a word is defined as set of letter which have 
  space before and space at end
---------------------------------------------------------------------------------------------------------- */

  int wordCount() {
    var wordList = TfString.getListOfWords(trim());
    return wordList.length;
  }

/*----------------------------------------------------------------------------------------------------------
Removes the abusive word found in string, these abusive word is defined in constant map
---------------------------------------------------------------------------------------------------------- */

  String removeAbusiveWords() {
    String thisString = this;

    if (BadWordUtil.isBadWord(thisString)) {
      thisString = BadWordUtil.getCleanString(thisString);
    }
    return thisString;
  }

/*----------------------------------------------------------------------------------------------------------
  Finds word1 and if it exists in the stirng then it removes it and replaces it with the given word2
---------------------------------------------------------------------------------------------------------- */

  String replace(word1, word2) {
    TfString tfString = TfString();
    var wordList = TfString.getListOfWords(trim());
    for (int index = 0; index < wordList.length; index++) {
      if (wordList[index].toLowerCase() == word1) wordList[index] = word2;
    }

    String finalWord = "";
    for (var word in wordList) {
      finalWord += word + " ";
    }
    return finalWord;
  }

/*----------------------------------------------------------------------------------------------------------
End of file 
---------------------------------------------------------------------------------------------------------- */
}
