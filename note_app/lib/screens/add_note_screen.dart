import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/home_screen.dart';
import 'package:note_app/utils/database_helper.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
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
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
        child: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: titleEditingController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Title'),
                style: const TextStyle(
                    fontSize: 25,
                    decorationThickness: 0,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: TextField(
                  controller: bodyEditingController,
                  keyboardType: TextInputType.multiline,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(fontSize: 18, decorationThickness: 0),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            title = titleEditingController.text;
            body = bodyEditingController.text;
            // createDate = DateFormat.yMd().format(DateTime.now());
            createDate = 'd';
          });
          NoteModel note =
              NoteModel(title: title, body: body, createDate: createDate);
          addNote(note);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
        },
        child: const Icon(Icons.save_rounded),
      ),
    );
  }
}
