import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../utils/dialogs.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_form_field_widget.dart';

class AddTodoScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddTodoScreen());

  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController controllerNameTodo = TextEditingController();
  final TextEditingController controllerEmoji = TextEditingController();
  final TextEditingController controllerNote = TextEditingController();
  Color? todoColor;

  bool showEmojiKeyboard = false;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.chevron_left_rounded,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
          ),
          title: const Text(
            'Add ToDo',
            style: TextStyle(
              color: Color(0xff1c323f),
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextFormFieldWidget(
                        controller: controllerNameTodo,
                        hint: 'Todo name',
                      ),
                    ),
                    // const SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 3,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormFieldWidget(
                        controller: controllerEmoji,
                        hint: 'Emoji',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormFieldWidget(
                  keyboardType: TextInputType.multiline,
                  controller: controllerNote,
                  maxLines: 5,
                  hint: 'Note',
                ),
                const SizedBox(height: 10),
                ButtonWidget(
                  onTap: () {
                    Dialogs.colorPickerDialog(
                      context: context,
                      onChanged: (color) {
                        setState(() {
                          todoColor = color;
                        });
                      },
                      initialColor: Colors.grey.shade400,
                      pickedColor: todoColor,
                    );
                  },
                  text: todoColor == null
                      ? 'Click Here to select todo color'
                      : 'All right',
                  color: todoColor == null ? Colors.grey.shade400 : todoColor!,
                ),
                const Spacer(),
                ButtonWidget(
                  onTap: () {},
                  text: 'Apply',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
