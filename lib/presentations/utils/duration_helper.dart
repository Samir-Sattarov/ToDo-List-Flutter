class DurationHelper {
  static String format(Duration d) {
    var seconds = d.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('${hours}h');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m');
    }

    if (seconds != 0) {
      tokens.add('${seconds}s');
    }

    return tokens.join(' ');
  }

  Duration parseDurationFromString(String input) {
    final parts = input.split(':');

    if (parts.length != 3) throw const FormatException('Invalid time format');

    int days;
    int hours;
    int minutes;
    int seconds;
    int milliseconds;
    int microseconds;

    {
      final p = parts[2].split('.');

      if (p.length != 2) throw const FormatException('Invalid time format');

      final p2 = int.parse(p[1].padRight(6, '0'));
      microseconds = p2 % 1000;
      milliseconds = p2 ~/ 1000;

      seconds = int.parse(p[0]);
    }

    minutes = int.parse(parts[1]);

    {
      int p = int.parse(parts[0]);
      hours = p % 24;
      days = p ~/ 24;
    }

    return Duration(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
      microseconds: microseconds,
    );
  }
}
