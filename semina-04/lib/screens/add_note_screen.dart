import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:quiz_demo/models/note_model.dart';
import 'package:quiz_demo/screens/home_screen.dart';
import 'package:quiz_demo/utils/database_helper.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<AddNoteScreen> {
  late String title;
  late String body;
  late String createDate;
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController bodyEditingController = TextEditingController();

  addNote(NoteModel note) {
    DatabaseHelper.db.addNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleEditingController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: '제목'),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: TextField(
              controller: bodyEditingController,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              title = titleEditingController.text;
              body = bodyEditingController.text;
              createDate = DateFormat.yMd().format(DateTime.now());
            });
            NoteModel note =
                NoteModel(title: title, body: body, createDate: createDate);
            addNote(note);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          },
          label: const Text('저장')),
    );
  }
}
