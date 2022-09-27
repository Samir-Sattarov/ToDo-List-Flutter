import 'package:flutter/material.dart';

import '../../data/entity/todo_entity.dart';
import '../utils/date_time_helper.dart';

class TodoCardWidget extends StatelessWidget {
  final TodoEntity entity;

  const TodoCardWidget({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 10, bottom: 3, top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: entity.color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 20,
              ),
            ],
          ),
          child: Opacity(
            opacity: 0,
            child: AbsorbPointer(
              child: _body(),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 15, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 20,
              ),
            ],
          ),
          child: _body(),
        ),
      ],
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  entity.category,
                  style: TextStyle(
                    color: entity.color,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                Text(
                  " ${entity.emoji.toString()}",
                ),
                const Spacer(),
                DateTimeHelper().calculateDifference(entity.savedTime) != 0
                    ? Text(
                        'Days Ago ${DateTimeHelper().calculateDifference(entity.savedTime).toString()}',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      )
                    : const SizedBox(),
                Text(
                  entity.savedTimeFormatted,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              entity.note,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}
