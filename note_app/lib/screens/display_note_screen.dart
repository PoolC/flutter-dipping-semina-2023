import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/home_screen.dart';
import 'package:note_app/utils/database_helper.dart';

class DisplayNoteScreen extends StatefulWidget {
  final Map note;

  const DisplayNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  State<DisplayNoteScreen> createState() => _DisplayNoteScreenState();
}

class _DisplayNoteScreenState extends State<DisplayNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.note['title'],
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: () {
                      DatabaseHelper.db.deleteNote(widget.note['id']);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const  HomeScreen()),
                          (route) => false);
                    },
                  )
                ],
              ),
              Text(
                widget.note['body'],
              )
            ],
          ),
        ),
      ),
    );
  }
}
