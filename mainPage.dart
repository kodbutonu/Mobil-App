import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport/MenuWidget.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  TextEditingController val = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _text(context),
            _search(context),
          ],
        ),
      ),
    );
  }

  Widget _search(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 95, left: 10, right: 10),
      width: 400,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(offset: Offset(0, 10), blurRadius: 50)]),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Arama Yap',
            hintStyle: GoogleFonts.aladin(
              fontStyle: FontStyle.italic,
              color: Colors.blue,
              fontSize: 18,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: Icon(Icons.search)),
      ),
    );
  }

  Widget _text(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Text(
        'Hosgeldin, Özgür!',
        style: GoogleFonts.aladin(
          fontStyle: FontStyle.italic,
          color: Colors.blue,
          fontSize: 40,
        ),
      ),
    );
  }
}
