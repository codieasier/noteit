import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteit/components/drawer.dart';
import 'package:noteit/models/note.dart';
import 'package:noteit/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, readNotes);
  }

  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Note"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Enter your note"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.read<NoteDatabase>().addNote(textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  void updateNote(Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Note'),
        content: TextField(controller: textController),
        actions: [
          TextButton(
            onPressed: () {
              context.read<NoteDatabase>().updateNotes(note.id, textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = noteDatabase.currentNotes;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(




        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: theme.colorScheme.secondary,
        foregroundColor: theme.colorScheme.inversePrimary,
        child: const Icon(Icons.note,size: 30,),
      ), drawer: const MyDrawer(),
      body:

          Column(
   crossAxisAlignment: CrossAxisAlignment.start,
            children: [

      Padding(
        padding: const EdgeInsets.all(25),child:   Text(
        'My Notes',style :GoogleFonts.dmSerifText(fontSize: 30, fontWeight: FontWeight.w700,
      color: theme.colorScheme.inversePrimary)
      )
      )

        ,Expanded(
                child: ListView.builder(


          itemCount: currentNotes.length,
          itemBuilder: (context, index) {
            final note = currentNotes[index];

            return Card(
              color: theme.colorScheme.primary,
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(vertical: 6,horizontal: 20),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                title: Text(
                  note.text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface, //
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => updateNote(note),
                      icon: const Icon(Icons.edit),
                      color: theme.colorScheme.inversePrimary,
                    ),
                    IconButton(
                      onPressed: () => deleteNote(note.id),
                      icon: const Icon(Icons.delete),
                      color: theme.colorScheme.error,
                    ),
                  ],
                ),
              ),
            );
          },
        ),)
      ]),//اهني يتم
    );
  }
}
