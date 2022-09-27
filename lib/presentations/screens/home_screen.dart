import 'package:flutter/material.dart';

import '../../data/entity/todo_entity.dart';
import '../utils/color_helper.dart';
import '../widgets/todo_card_widget.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ToDo',
          style: TextStyle(
            color: Color(0xff1c323f),
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(AddTodoScreen.route());
            },
            child: const Text('New todo'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                10,
                (index) => TodoCardWidget(
                  entity: TodoEntity(
                    category: 'Coding',
                    note: 'Note ',
                    emoji: '🤩',
                    savedTime: DateTime.now(),
                    time: const Duration(minutes: 26, hours: 1),
                    color: ColorHelper().generateColor(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
