import 'package:flutter/material.dart';
import 'package:noteit/pages/notes_page.dart';
import 'package:noteit/themes/themeProvider.dart';
import 'package:provider/provider.dart';
import 'models/note_database.dart';
import 'pages/notes_page.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
     MultiProvider(providers: [
         ChangeNotifierProvider(create: (context) => NoteDatabase()),
         ChangeNotifierProvider(create: (context) =>ThemeProvider()),
     ],child:const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:NotesPage(),
      theme: context.watch<ThemeProvider>().themeData,
    );}}