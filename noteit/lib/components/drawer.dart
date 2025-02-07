import 'package:flutter/material.dart';
import 'package:noteit/components/drawer_tile.dart';
import 'package:noteit/pages/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor:Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //the header
       const  DrawerHeader(child: Icon(Icons.note,size: 50,)),
          //notes tile
          DrawerTile(title: 'Notes', leading:const Icon(Icons.home),
              onTap:()=>Navigator.pop(context))
          //settings tile

          ,DrawerTile(title: 'Settings', leading:const Icon(Icons.settings),

              onTap:(){
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(builder: (context)=>SettingsPage()));

          })

        ],
      ),



    );
  }
}
