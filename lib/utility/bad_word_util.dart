import 'package:profanity_filter/profanity_filter.dart';

class BadWordUtil {
  static final filter = ProfanityFilter();

  // check if the string contains any bad word
  static bool isBadWord(String word) {
    return filter.hasProfanity(word);
  }
  // remove abusive words
  static String getCleanString(String word) {
    return filter.censor(word);
  }
}
