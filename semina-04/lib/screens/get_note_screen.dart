import 'package:flutter/material.dart';

class GetNoteScreen extends StatefulWidget {
  const GetNoteScreen({Key? key}) : super(key: key);
  @override
  State<GetNoteScreen> createState() => _GetNoteScreenState();
}

class _GetNoteScreenState extends State<GetNoteScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
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
    );
  }
}
