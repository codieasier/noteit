import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:noteit/models/note.dart';
import 'package:path_provider/path_provider.dart';
class NoteDatabase extends ChangeNotifier{
//database
static late Isar isar;
static Future<void>initialize()async{
final dir = await getApplicationDocumentsDirectory();
isar = await Isar.open([NoteSchema],
    directory: dir.path,
);
}
//list of notes
final List<Note> _currentNotes=[];
    List<Note> get currentNotes => List.unmodifiable(_currentNotes);


//create
Future<void> addNote(String textFromUser)async{
final newNote=Note()..text=textFromUser;
await isar.writeTxn(() async {isar.notes.put(newNote);});

fetchNotes();
}

//read from db

Future<void> fetchNotes()async{
List<Note> fetchedNotes=await isar.notes.where().findAll();
_currentNotes.clear();
_currentNotes.addAll(fetchedNotes);
notifyListeners();
}

//update

Future<void> updateNotes(int id,String newText)async{
    final existingNote=await isar.notes.get(id);
    if (existingNote!=null){
        existingNote.text=newText;
        await isar.writeTxn(()async{isar.notes.put(existingNote);});
         await fetchNotes();
    }

}

//delete
Future<void> deleteNote(int id)async{
    await isar.writeTxn(()async{isar.notes.delete(id);});
    await fetchNotes();
}

}