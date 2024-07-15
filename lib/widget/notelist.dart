import 'package:flutter/material.dart';
import 'package:noteapp/database/DBHelper.dart';
import 'package:noteapp/model/db_model.dart';
import 'package:noteapp/pages/add_notes.dart';

class MyNoteList extends StatefulWidget {
  final Note note;
  const MyNoteList({super.key, required this.note});

  @override
  State<MyNoteList> createState() => _MyNoteListState();
}

class _MyNoteListState extends State<MyNoteList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNotes(
                note: widget.note,
              ),
            )),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue.shade600),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.note.title,
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.note.content,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
