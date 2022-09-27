import 'package:flutter/material.dart';

import '../../presentations/utils/date_time_helper.dart';
import '../../presentations/utils/duration_helper.dart';

class TodoEntity {
  final String category;
  final Duration time;
  final String note;
  final DateTime savedTime;
  final String? emoji;
  final Color color;

  String get timeFormatter => DurationHelper.format(time);

  String get savedTimeFormatted => DateTimeHelper.format(savedTime);

  TodoEntity({
    this.emoji,
    required this.category,
    required this.time,
    required this.note,
    required this.savedTime,
    required this.color,
  });
}
