import 'package:flutter/material.dart';
import 'package:note_app/screens/add_note_screen.dart';
import 'package:note_app/screens/display_note_screen.dart';
import 'package:note_app/utils/database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getAllNotes() async {
    final notes = await DatabaseHelper.db.getAllNotes();
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My Notes', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Expanded(
                child: FutureBuilder(
                  future: getAllNotes(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      debugPrint('Error occurred');
                      return Center(
                        child: Text('Error : ${snapshot.error}'),
                      );
                    } else if (snapshot.data == null){
                      return const Center(
                        child: Text(''
                            '노트를 작성해보세요!',
                        style: TextStyle(fontSize: 20),),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          final note = snapshot.data[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayNoteScreen(note: note,)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Card(
                                child: ListTile(
                                  title: Text(note['title']),
                                  subtitle: Text(note['body']),
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNoteScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
