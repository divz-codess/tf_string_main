import 'package:emojis/emojis.dart';
import 'package:emojis/emoji.dart';

class EmojiUtils {
  static getEmoji(String emojiName) {
    print('emojiName: $emojiName');
    Iterable<Emoji> emoji = Emoji.byKeyword(emojiName.trim());
    if (emoji.length > 0) {
      print('emoji: $emoji');
      return emoji.first.char;
    }
    print('emoji: null');
    return "";
  }

  static isEmojiExists(String emojiName) {}
}
