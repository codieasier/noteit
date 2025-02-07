import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class DrawerTile extends StatelessWidget{
  final String title;
  final Widget leading;
  final void Function()? onTap;


  const DrawerTile({
    super.key
  ,required this.title
    ,required this.leading
    ,required this.onTap
  });
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:24.0),
      child: ListTile(
        title: Text(title,
        style: GoogleFonts.dmSerifText(fontWeight: FontWeight.w300,color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: leading,
        onTap: onTap,

      ),
    );
  }


}
