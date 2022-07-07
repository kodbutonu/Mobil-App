import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport/Screen.dart';

import 'Login.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: AssetImage('assets/engelli.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              _text(context),
              _logo(context),
              _textField(context),
              _buton(context),
              _text1(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: DefaultTextStyle(
          style: GoogleFonts.aladin(
            fontStyle: FontStyle.italic,
            color: Colors.blue,
            fontSize: 40,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('HOŞGELDİN'),
            ],
          )),
    );
  }

  Widget _logo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/a.png'),
      ),
    );
  }

  Widget _textField(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 70, left: 50, right: 50),
        child: Column(children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofocus: true,
            maxLines: 1,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                labelText: 'Email',
                hintText: 'Emaile giriniz.',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: 1,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  fillColor: Colors.white,
                  hoverColor: Colors.blue,
                  labelText: 'Şifre',
                  hintText: 'Şifreyi giriniz.',
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  )))
        ]),
      ),
    );
  }

  Widget _buton(BuildContext context) {
    return TextButton(
      onPressed: (() => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Screen()))),
      child: Text(
        'Giriş Yap',
        style: TextStyle(color: Colors.blue),
      ),
      style: ElevatedButton.styleFrom(primary: Colors.white),
    );
  }

  Widget _text1(BuildContext context) {
    return TextButton(
        onPressed: (() => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()))),
        child: Text(
          'Hesabım yok üye ol',
          style: GoogleFonts.aladin(
            fontStyle: FontStyle.italic,
            color: Colors.blue,
            fontSize: 20,
            decoration: TextDecoration.underline,
          ),
        ));
  }
}
