import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../presentations/screens/home_screen.dart';
import '../presentations/utils/color_helper.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorHelper().generateColor(),
        textTheme: GoogleFonts.montserratAlternatesTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
