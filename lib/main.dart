import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_morty/pages/details_caracter_page.dart';
import 'package:rick_morty/pages/home_page.dart';

void main() {
  runApp(rickMoryApp());
}

class rickMoryApp extends StatelessWidget {
  const rickMoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => HomePage(),
            );
          case '/details':
            int id = settings.arguments as int;
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => DetailsCharacterPage(id: id),
            );
          default:
            return null;
        }
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
