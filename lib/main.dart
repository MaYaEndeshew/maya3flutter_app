import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maya3flutter_app/Screens/home_screen.dart';
import 'package:maya3flutter_app/provider/todo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => myTodoProvider(),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme:GoogleFonts.nunitoSansTextTheme(

                ),
              ),
               home: Homepage(),
      ),
    );
  }


