import 'package:flutter/material.dart';
import 'package:noteapp/database/DBHelper.dart';

import 'package:noteapp/pages/add_notes.dart';
import 'package:noteapp/widget/notelist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
        title: Center(
          child: Text(
            "MY NOTES",
            style: TextStyle(letterSpacing: 1),
          ),
        ),
      ),

      //Retrieve data from sqflite
      body: FutureBuilder(
          future: NoteDatabase.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(
                  child: Text("No notes found"),
                );
              }

              //list of notes
              return ListView(
                children: [
                  for (var note in snapshot.data!)
                    MyNoteList(
                      note: note,
                    ),
                ],
              );
            }
            return Container();
          }),

      //create notes
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNotes(),
              ));
        },
        icon: Icon(Icons.add),
        label: Text('Add note'),
        backgroundColor: Colors.purple.shade700,
      ),
    );
  }
}
