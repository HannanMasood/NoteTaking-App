import 'package:flutter/material.dart';
import 'package:noteapp/database/DBHelper.dart';
import 'package:noteapp/model/db_model.dart';

class AddNotes extends StatefulWidget {
  final Note? note;
  const AddNotes({super.key, this.note});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _formKey =
      GlobalKey<FormState>(); // Added GlobalKey for form validation

  @override
  void initState() {
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Add Notes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Set the GlobalKey for the Form widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add title text
                Text(
                  "Title",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                // Title TextFormField
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _titleController,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add title',
                      hintStyle:
                          TextStyle(fontSize: 18, color: Colors.grey.shade500),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title is required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40),

                // Add content text
                Text(
                  "Content",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                // Content TextFormField
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    maxLines: 10,
                    controller: _contentController,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add note',
                      hintStyle:
                          TextStyle(fontSize: 18, color: Colors.grey.shade500),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Content is required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.note == null
                        ? InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _insertNote();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 175),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade700,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _updateNote();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 60),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade700,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Update",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                    widget.note != null
                        ? InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text("Are you sure?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _deleteNote();
                                      },
                                      child: Text("Yes"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 60),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.red.shade700,
                                borderRadius:
                                    BorderRadiusDirectional.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Insert function
  _insertNote() async {
    final note = Note(
      title: _titleController.text,
      content: _contentController.text,
    );
    await NoteDatabase.insert(note: note);
    Navigator.pop(context);
    print("Note Added");
  }

  // Update function
  _updateNote() async {
    final note = Note(
      id: widget.note!.id!,
      title: _titleController.text,
      content: _contentController.text,
    );
    await NoteDatabase.updateNote(note: note);
    Navigator.pop(context);
    print("Note Updated");
  }

  // Delete function
  _deleteNote() async {
    await NoteDatabase.deleteNotes(note: widget.note!).then((_) {
      Navigator.pop(context);
    });
    print("Note deleted");
  }
}
