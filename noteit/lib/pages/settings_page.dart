import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteit/themes/themeProvider.dart';
import 'package:provider/provider.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body:Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary
            ,    borderRadius: BorderRadius.circular(20)
          ),
          padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          margin:const EdgeInsets.only(left:25, right: 25)
          ,child:  Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children: [
          Text('Dark Mode',style:TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),
          ),
          CupertinoSwitch(
              value:
              Provider.of<ThemeProvider>(context,listen: false).isDarkMode,
              onChanged: (value)=>Provider.of<ThemeProvider>(context,listen: false).toggleTheme()

            )
        ],
      )
      ),

    );
  }
}
