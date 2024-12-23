class DateTimeHelper {
  static String formatAgoString(int milliseconds) {
    final postCreatedAt = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    final Duration difference = DateTime.timestamp().difference(postCreatedAt);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'just now';
    }
  }

  static int sqlTimeToMilliseconds(int sqlTime) => sqlTime * 1000;

  static int millisecondsToSqlTime(int milliseconds) => milliseconds ~/ 1000;
}
